module Rp
  class AuthorizedUser < ActiveRecord::Base
    belongs_to :user, class_name: "User"
    belongs_to :available_report
    
    before_validation :assign_user
    validates_uniqueness_of :user_id, scope: :available_report_id
    validates :user, presence: { message: 'not found' }
    validate :role_as_user
    
    attr_accessor :username
    

 
    private
    def assign_user
      self.user = User.find_by(username: username)
    end
    
    def role_as_user
      errors.add(:user_id, "does not have role user") unless user.try(:has_role?, :user)
    end    
  end
end
