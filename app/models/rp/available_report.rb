module Rp
  class AvailableReport < ActiveRecord::Base
    enum param_types: [:number, :date, :text]
    
    has_many :authorized_users
    has_many :users, through: :authorized_users, class_name: "User"
    
    store :param1, accessors: [:param1_name, :param1_type], coder: JSON
    store :param2, accessors: [:param2_name, :param2_type], coder: JSON
    store :param3, accessors: [:param3_name, :param3_type], coder: JSON
    store :param4, accessors: [:param4_name, :param4_type], coder: JSON
    store :param5, accessors: [:param5_name, :param5_type], coder: JSON
    
    validates_presence_of :name    
    validates_presence_of :param1_name, unless: "param2_name.blank?", message: "can't be blank when Param2 name is present"
    validates_presence_of :param2_name, unless: "param3_name.blank?", message: "can't be blank when Param3 name is present"
    validates_presence_of :param3_name, unless: "param4_name.blank?", message: "can't be blank when Param4 name is present"
    validates_presence_of :param4_name, unless: "param5_name.blank?", message: "can't be blank when Param5 name is present"

    before_create :set_param_cnt
    
    def authorized_user?(user)
      is_public == 'Y' || authorized_users.where(user_id: user.id).exists?
    end
    
    # all public reports, and all private reports to whom the user is authorized
    def self.for_user(user)
      available_report = AvailableReport.arel_table
      authorized_user = AuthorizedUser.arel_table
      
      constraints = available_report.create_on(
                      available_report[:id].eq(authorized_user[:available_report_id]).
                        and(authorized_user[:user_id].eq(user.id))).
                        and(available_report[:is_public].eq('N'))
      
      join = available_report.create_join(authorized_user, constraints)

      authorized_and_public = AvailableReport.joins(join).union(:all, available_report.project(available_report[Arel.star]).where(available_report[:is_public].eq('Y')))          
      
      AvailableReport.from(available_report.create_table_alias(authorized_and_public, 'rp_available_reports'))
    end
    
    private
    def set_param_cnt
      self.params_cnt = 0
      self.params_cnt += 1 unless param1_name.blank?
      self.params_cnt += 1 unless param2_name.blank?
      self.params_cnt += 1 unless param3_name.blank?
      self.params_cnt += 1 unless param4_name.blank?
      self.params_cnt += 1 unless param5_name.blank?      
    end    
  end
end
