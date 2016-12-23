module Rp
  class AvailableReportPolicy < ApplicationPolicy
    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user  = user
        @scope = scope
      end

      def resolve
        scope.where(is_public: 'Y')
      end
    end

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