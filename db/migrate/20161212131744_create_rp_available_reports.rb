class CreateRpAvailableReports < ActiveRecord::Migration
  def change
    create_table :rp_available_reports do |t|
      t.string :name, null: false, comment: 'the internal code for this report'
      t.string :dsn, comment: 'the jdbc data source where the report should be run'
      t.string :db_unit, comment: 'the package that will return the result set of the report'
      t.string :batch_size, comment: 'the batch size for the report'
      t.string :msg_model, comment: 'the dfdl message model'
      t.string :mime_type, comment: 'the output file mime type'
      t.string :file_ext, comment: 'the file extension for the report'

      t.timestamps null: false
    end
  end
end
