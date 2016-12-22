module Rp
  class Report < ActiveRecord::Base
    store :param1, accessors: [:param1_name, :param1_type, :param1_value], coder: JSON
    store :param2, accessors: [:param2_name, :param2_type, :param2_value], coder: JSON
    store :param3, accessors: [:param3_name, :param3_type, :param3_value], coder: JSON
    store :param4, accessors: [:param4_name, :param4_type, :param4_value], coder: JSON
    store :param5, accessors: [:param5_name, :param5_type, :param5_value], coder: JSON
    
    has_one :pending_report, foreign_key: 'rp_reports_id', class_name: 'PendingReport'
    accepts_nested_attributes_for :pending_report
    attr_accessor :protocol, :host, :run_at
    
    before_save :enqueue_report
    after_create :set_report_url

    private
    
    def enqueue_report
      self.pending_report = Rp::PendingReport.new(created_at: Time.now, run_at: self.run_at)
    end

    def set_report_url
      self.update_column(:report_url, "#{self.protocol}#{self.host}#{Rp.root_url}/reports/#{self.id}")
    end
  end
end
