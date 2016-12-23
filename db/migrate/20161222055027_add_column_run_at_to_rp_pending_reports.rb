class AddColumnRunAtToRpPendingReports < ActiveRecord::Migration
  def change
    add_column :rp_pending_reports, :run_at, :datetime, comment: 'the scheduled time for the report to get generated'
  end
end
