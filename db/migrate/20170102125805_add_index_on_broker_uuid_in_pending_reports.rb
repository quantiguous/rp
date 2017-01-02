class AddIndexOnBrokerUuidInPendingReports < ActiveRecord::Migration
  def change
    add_index :rp_pending_reports, :broker_uuid
  end
end
