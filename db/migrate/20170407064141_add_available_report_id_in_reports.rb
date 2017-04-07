class AddAvailableReportIdInReports < ActiveRecord::Migration
  def change
    add_column :rp_reports, :available_report_id, :integer, comment: 'the id of the available_report for this report'
  end
end
