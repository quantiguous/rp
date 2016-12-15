require_dependency "rp/application_controller"

module Rp
  class AvailableReportsController < ApplicationController
    def index
      @available_reports = AvailableReport.order(:name)
    end
  end
end
