require_dependency "rp/application_controller"

module Rp
  class AvailableReportsController < ApplicationController
    before_action :set_report, only: [:generate, :show, :destroy, :add_authorized_user]

    def index
      available_reports = policy_scope(Rp::AvailableReport).order(:name)
      @available_reports = available_reports.paginate(per_page: 10, page: params[:page])
    end
    
    def generate
      authorize @available_report
      respond_to do |format|
        format.js
      end
    end
    
    def destroy
     authorize @available_report
     @available_report.destroy
     redirect_to available_reports_path, notice: 'Report was successfully deleted.'
    end
    
    def add_authorized_user
      authorize @available_report
      @authorized_user = @available_report.authorized_users.build
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
        params.require(:available_report).permit(:code, :name, :dsn, :db_unit, :batch_size, :is_public, :mime_type,
        :header_kind, :money_format, :normalize_space, :delimiter, :escape_character, :service_code, :msg_model, 
        :param1_name, :param1_type, 
        :param2_name, :param2_type, 
        :param3_name, :param3_type, 
        :param4_name, :param4_type, 
        :param5_name, :param5_type)
      end
  end
end
