require 'rails_helper'

module Rp
  RSpec.describe PendingReport, type: :model do
    context 'association' do
      it { should belong_to(:report) }
    end
  end
end
