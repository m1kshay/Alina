# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_writer :instances

    def instances
      @instances ||= 0
    end

    def instance_counter
      @instances = instances + 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instance_counter
    end
  end
end
