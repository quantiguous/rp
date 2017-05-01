FactoryGirl.define do
  factory :rp_available_report, class: 'Rp::AvailableReport' do
    name 'FT2 Report'
    dsn 'SC'
    db_unit 'pk_qg_test_package.get_neft_report'
    batch_size 50
    msg_model 'FT2-Model'
    mime_type 'text/plain'
    header_kind 'C'
  end
end
