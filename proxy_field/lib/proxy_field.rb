module StarterStep

  module ProxyField
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def proxy_field(fields, attr={})
        raise "You must provide the proxy class as an :as key" unless attr[:as]
        Array(fields).each do |method|
          define_method(method){attr[:as].new(self[method])}
        end
      end
    end  
  end

end

ActiveRecord::Base.send(:include, StarterStep::ProxyField)