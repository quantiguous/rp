class RenameColumnRpReportsIdInPendingReports < ActiveRecord::Migration
  def change
    rename_column :rp_pending_reports, :rp_reports_id, :report_id
  end
end
