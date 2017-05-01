class User < ActiveRecord::Base
  
  def has_role?(role)
    true
  end
end