module Rp
  class Param
    include ActiveModel::Model
    include ActiveModel::Associations
  
    attr_accessor :name, :data_type, :is_mandatory, :pattern
  end
end