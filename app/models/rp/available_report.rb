module Rp
  class AvailableReport < ActiveRecord::Base
    enum param_types: [:number, :date, :text]
    
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

    validate :validate_params
    before_create :set_param_cnt
    
    private
    def set_param_cnt
      self.params_cnt = 0
      self.params_cnt += 1 unless param1_name.blank?
      self.params_cnt += 1 unless param2_name.blank?
      self.params_cnt += 1 unless param3_name.blank?
      self.params_cnt += 1 unless param4_name.blank?
      self.params_cnt += 1 unless param5_name.blank?      
    end
    
    def validate_params
    end
  end
end
