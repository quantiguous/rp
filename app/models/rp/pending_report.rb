module Rp
  class PendingReport < ActiveRecord::Base
    belongs_to :report
    
    validate :value_of_run_at
    
    def value_of_run_at
      errors.add(:run_at, "should be a future date") if run_at.present? && run_at < Time.zone.today
      errors.add(:run_at, "should be a date within one month") if run_at.present? && ((Time.zone.today + 30.days) < run_at)
    end
  end
end