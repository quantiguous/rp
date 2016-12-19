module Rp
  class PendingReport < ActiveRecord::Base
    belongs_to :report, foreign_key: 'rp_reports_id', class_name: 'Report'

  end
end