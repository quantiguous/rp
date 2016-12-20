require_dependency "rp/application_controller"

module Rp
  class ReportsController < ApplicationController
    before_action :set_report, only: [:destroy]

    # GET /reports
    def index
      reports = Report.order('id desc')
      @reports = reports.paginate(per_page: 30, page: params[:page])
    end

    # POST /reports
    def create
      @report = Report.new(report_params)

      if @report.save
        redirect_to reports_path, notice: 'Report was successfully created.'
      else
        render :new
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

      begin
        uri = URI(report.file_url)
        if uri.scheme == "scp"
          data = open("#{report.file_url}").read
          send_data data, filename: report.file_name, type: report.mime_type
        elsif uri.scheme == "file"
          send_file uri.path, filename: report.file_name, type: report.mime_type
        else
          raise "Not Implemented"
        end
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

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        @report = Report.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def report_params
        params.permit(:name, :state, :mime_type, :queued_at, :dsn, :db_unit, :batch_size, :msg_model, :mime_type, :file_ext,
        :param1_name, :param1_type, :param1_value,
        :param2_name, :param2_type, :param2_value, 
        :param3_name, :param3_type, :param3_value, 
        :param4_name, :param4_type, :param4_value, 
        :param5_name, :param5_type, :param5_value)
        .merge(created_by: try(:current_user).try(:name) || '',
               protocol: request.protocol, 
               host: request.host_with_port)
      end
  end
end
