module Rp
  class PendingReport < ActiveRecord::Base
    belongs_to :report, foreign_key: 'rp_reports_id', class_name: 'Report'

    validate :presence_of_broker_uuid

    def presence_of_broker_uuid
      errors[:base] << 'Cannot generate a report unless Broker UUID is set' if Rp.broker_uuid.nil?
    end

  end
end