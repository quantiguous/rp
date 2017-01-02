require_dependency "rp/application_controller"

module Rp
  class ReportsController < ApplicationController
    include ReportsHelper
    before_action :set_report, only: [:destroy, :retry]

    # GET /reports
    def index
      reports = policy_scope(Rp::Report).order('id desc')
      @reports = reports.paginate(per_page: 10, page: params[:page])
    end

    # POST /reports
    def create
      @report = Report.new(report_params)

      if @report.save
        redirect_to reports_path, notice: 'Report was successfully created.'
      else
        redirect_to available_reports_path, notice: @report.errors.full_messages        
      end
    end

    def show
      @report = Report.find(params[:id])
      respond_to do |format|
        format.js
      end      
    end

    def download
      require 'uri'
      require 'uri/open-scp'
      report = Report.find(params[:id])
      
      authorize report

      begin
        uri = URI(report.file_url)
        if uri.scheme == Setting::FILE_SCHEMES[:scp]
          file_url = report.file_url
        elsif uri.scheme == Setting::FILE_SCHEMES[:file]
          file_url = "#{report.file_path}/#{report.file_name}"
        else
          raise "Not Implemented"
        end
        download_file(file_url, report)
      rescue StandardError => e
        redirect_to reports_path, notice: e.message
      end
    end

    def show_fault
      report = Report.find(params[:id])
      @fault = report # report responds to fault
      respond_to do |format|
        format.js
      end
    end
    
    def retry
      @report.enqueue_report
      redirect_to reports_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        @report = Report.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def report_params
        params.permit(:name, :state, :mime_type, :queued_at, :dsn, :db_unit, :batch_size, :msg_model, :mime_type, :file_ext, :run_at,
        :param1_name, :param1_type, :param1_value,
        :param2_name, :param2_type, :param2_value, 
        :param3_name, :param3_type, :param3_value, 
        :param4_name, :param4_type, :param4_value, 
        :param5_name, :param5_type, :param5_value)
        .merge(created_by: try(:current_user).try(:id) || '',
               protocol: request.protocol, 
               host: request.host_with_port)
      end
  end
end
