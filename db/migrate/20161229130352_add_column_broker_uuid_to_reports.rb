class AddColumnBrokerUuidToReports < ActiveRecord::Migration
  def change
    add_column :rp_reports, :broker_uuid, :string, limit: 100, comment: 'the uuid of the broker which generated the report'
  end
end
