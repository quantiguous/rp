module Rp
  class Report < ActiveRecord::Base
    store :param1, accessors: [:param1_name, :param1_type, :param1_value], coder: JSON
    store :param2, accessors: [:param2_name, :param2_type, :param2_value], coder: JSON
    store :param3, accessors: [:param3_name, :param3_type, :param3_value], coder: JSON
    store :param4, accessors: [:param4_name, :param4_type, :param4_value], coder: JSON
    store :param5, accessors: [:param5_name, :param5_type, :param5_value], coder: JSON
    
    validate :params_should_be_correct
    
    has_one :pending_report
    accepts_nested_attributes_for :pending_report
    attr_accessor :protocol, :host, :run_at
    
    before_validation :enqueue_report
    after_create :set_report_url

    def created_by
      self[:created_by].to_i
    end
    
    def enqueue_report
      self.pending_report = Rp::PendingReport.new(created_at: Time.now, run_at: self.run_at)
    end

    private

    def set_report_url
      self.update_column(:report_url, "#{self.protocol}#{self.host}#{Rp.root_url}/reports/#{self.id}")
    end
    
    def params_should_be_correct
      validate_param(:param1, param1_name, param1_type, param1_value)
      validate_param(:param2, param2_name, param2_type, param2_value)
      validate_param(:param3, param3_name, param3_type, param3_value)
      validate_param(:param4, param4_name, param4_type, param4_value)
      validate_param(:param5, param5_name, param5_type, param5_value)
    end
  
    def validate_param(attr_name, param_name, param_type, param_value)
      errors.add(attr_name, "can't be blank") if param_name.present? and param_value.blank?
      DateTime.parse param_value rescue errors.add(attr_name, "is not a date") if param_type == "date"
      errors.add(attr_name, "is longer than maximum (50)") if param_type == "text" and param_value.length > 50
      errors.add(attr_name, "should not include special characters") if param_type == "text" and (param_value =~ /[A-Za-z0-9]+$/).nil?
    end
  end
end
