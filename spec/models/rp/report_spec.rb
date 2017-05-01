require 'rails_helper'

module Rp
  RSpec.describe Report, type: :model do
    context 'association' do
      it { should have_one(:pending_report) }
    end

    context 'create_pending_report' do
      it 'should enqueue report' do
        report = FactoryGirl.build(:rp_report)
        expect(report.save).to eq(true)
        expect(report.pending_report).not_to be_nil
      end
    end
  end
end
