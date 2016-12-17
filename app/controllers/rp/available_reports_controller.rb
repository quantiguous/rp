require_dependency "rp/application_controller"

module Rp
  class AvailableReportsController < ApplicationController

    def new
      @available_report = AvailableReport.new
    end
    
    def create
      @available_report = AvailableReport.new(available_report_params)

      if @available_report.save
        redirect_to available_reports_path, notice: 'Report was successfully created.'
      else
        render :new
      end
    end

    def index
      @available_reports = AvailableReport.order(:name)
    end
    
    def generate
      @available_report = AvailableReport.find(params[:id])
      respond_to do |format|
        format.js
      end
    end
    
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        @available_report = AvailableReport.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def available_report_params
        params.require(:available_report).permit(:name, :dsn, :db_unit, :batch_size, :mime_type, :file_ext,
        :param1_name, :param1_type, 
        :param2_name, :param2_type, 
        :param3_name, :param3_type, 
        :param4_name, :param4_type, 
        :param5_name, :param5_type)
      end
  end
end
