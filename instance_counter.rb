module InstanceCounter
  def self.included(class_name)
    class_name.extend ClassMethods
    class_name.send :include, InstanceMethods
  end
  
  module ClassMethods
    attr_accessor :count
    
    def new_instance
      @count ||= 0
      self.count += 1
    end
    
    def instances
      self.count
    end
  end
  
  module InstanceMethods
    protected
    
    def register_instance
      self.class.new_instance
    end
  end
end
