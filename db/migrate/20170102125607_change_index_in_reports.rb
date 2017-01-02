class ChangeIndexInReports < ActiveRecord::Migration
  def change
    remove_index :rp_reports, :state
    add_index :rp_reports, [:state, :broker_uuid]
  end
end
