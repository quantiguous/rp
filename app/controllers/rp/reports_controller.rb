require_dependency "rp/application_controller"

module Rp
  class ReportsController < ApplicationController
    before_action :set_report, only: [:destroy]

    # GET /reports
    def index
      reports = Report.order('id desc')
      @reports = reports.paginate(per_page: 30, page: params[:page])
    end

    # GET /reports/new
    def new
      @report = Report.new
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

    def download
      require 'uri/open-scp'
      report = Report.find(params[:id])
      
      # cmd = "scp://iibadm@#{Rp.host}"
      data = open("#{report.file_path}/#{report.file_name}").read rescue ""
      send_data data, filename: report.file_name, type: report.mime_type
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        @report = Report.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def report_params
        params.permit(:rp_available_reports_id, :name, :state, :mime_type, :queued_at, :dsn, :db_unit, :batch_size, :msg_model, :mime_type, :file_ext)
        .merge(created_by: try(:current_user).try(:name) || '',
               protocol: request.protocol, 
               host: request.host_with_port)
      end
  end
end
