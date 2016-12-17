module Rp
  class Setting < ActiveRecord::Base
    before_create :confirm_singularity

    private

    def confirm_singularity
      raise Exception.new("There can be only one.") if Setting.count > 0
    end
  end
end
