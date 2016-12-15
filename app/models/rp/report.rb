module Rp
  class Report < ActiveRecord::Base
    has_one :pending_report, foreign_key: 'rp_reports_id', class_name: 'PendingReport'
    accepts_nested_attributes_for :pending_report
    attr_accessor :protocol, :host

    before_validation :enqueue_report
    after_create :set_report_url

    private
    
    def enqueue_report
      self.pending_report = Rp::PendingReport.new(broker_uuid: Rp.broker_uuid, created_at: Time.now)
    end

    def set_report_url
      self.update_column(:report_url, "#{self.protocol}#{self.host}#{Rp.root_url}/reports/#{self.id}")
    end
  end
end
