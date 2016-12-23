module Rp
  class AvailableReportPolicy < ApplicationPolicy
    def edit?      
      user.has_role? :editor
    end
    
    def generate?
      user.has_role? :user
    end
    
    def destroy?
      user.has_role? :editor
    end
  end
end