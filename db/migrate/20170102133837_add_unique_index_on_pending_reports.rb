class AddUniqueIndexOnPendingReports < ActiveRecord::Migration
  def change
    add_index :rp_pending_reports, :report_id, unique: true
  end
end
