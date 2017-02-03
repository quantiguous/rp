class AddNewColumnsToReports < ActiveRecord::Migration
  def change
    add_column :rp_reports, :data_header, :string, limit: 1, default: 'N', null: false, comment: 'the flag which indicates whether data header is required or not'
    add_column :rp_reports, :money_format, :string, limit: 20, default: '###,###,##0.00', null: false, comment: 'the format for money in the report'
  end
end
