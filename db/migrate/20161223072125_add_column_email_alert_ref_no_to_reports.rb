class AddColumnEmailAlertRefNoToReports < ActiveRecord::Migration
  def change
    add_column :rp_reports, :email_alert_ref_no, :string, comment: 'the reference number for the email notification which was sent to the user'
  end
end
