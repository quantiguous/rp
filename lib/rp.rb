require "rp/engine"

module Rp
  mattr_accessor :generator_class
  mattr_accessor :broker_uuid
  mattr_accessor :host
  mattr_accessor :root_url
  
  def self.generator_class
    @@generator_class.constantize
  end

  # this function maps the vars from your app into your engine
  def self.setup(&block)
     yield self
  end
end
