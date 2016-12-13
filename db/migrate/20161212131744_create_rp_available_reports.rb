class CreateRpAvailableReports < ActiveRecord::Migration
  def change
    create_table :rp_available_reports do |t|
      t.string :code, null: false, comment: 'the internal code for this report'
      t.string :dsn, comment: 'the jdbc data source where the report should be run'
      t.string :db_unit_name, comment: 'the package that will return the result set of the report'
      t.string :msg_model, comment: 'the dfdl message model'
      t.string :mime_type, comment: 'the output file mime type'

      t.timestamps null: false
    end
  end
end
