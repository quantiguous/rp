module Rp
  class SettingPolicy < ApplicationPolicy
    def edit?
      user.has_role? :editor
    end

    def index?
      user.has_role? :editor
    end
    
    def new?
      user.has_role? :editor
    end
  end
end