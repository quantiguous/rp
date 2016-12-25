require_dependency "rp/application_controller"

module Rp
  class SettingsController < ApplicationController
    before_action :set_setting, only: [:edit, :update, :destroy]
    
    def new
      @setting = Setting.new
    end
    
    # POST /reports
    def create
      @setting = Setting.new(setting_params)

      if @setting.save
        redirect_to settings_path, notice: 'Setting was successfully created.'
      else
        render :new
      end
    end

    # GET /setups
    def index
      @settings = Setting.all
      @settings_count = @settings.count
    end

    # GET /setups/1/edit
    def edit
    end

    # PATCH/PUT /setups/1
    def update
      if @setting.update(setting_params)
        redirect_to settings_path, notice: 'Setting was successfully updated.'
      else
        render :edit
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_setting
        @setting = Setting.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def setting_params
        params.require(:setting).permit(:scheme, :host, :username, :port, :virtual_url, :max_age_days, :max_per_user)
      end
  end
end
