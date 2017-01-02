class AddIndexToStateInReports < ActiveRecord::Migration
  def change
    add_index :rp_reports, :state
  end
end
