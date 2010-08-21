module ActiveDirect
  module ActsAsDirect
    mattr_accessor :enable_default_methods
    @@enable_default_methods = true

    DEFAULT_METHODS = {'create' => 1, 'update' => 2, 'update_all' => 2, 'delete' => 1 , 'delete_all' => 1,
      'exists' => 1 , 'find' => 1, 'find_every' => 1, 'first' => 0, 'last' => 0, 'all' => 1, 'count' => 0 }
    
    def self.included(base)
      base.extend ClassMethods
			class << base
				alias_method :exists, :exists?
			end
    end

    module ClassMethods
      def acts_as_direct(direct_methods={})
        Config.method_config[self.to_s].clear

        direct_methods.stringify_keys!
        direct_methods.merge!(DEFAULT_METHODS) if ActiveDirect::ActsAsDirect.enable_default_methods

        direct_methods.each do |mtd, mcfg|
          if mcfg.is_a?(Hash)
            Config.method_config[self.to_s] << {'name' => mtd}.merge!(mcfg)
          else
            Config.method_config[self.to_s] << { 'name' => mtd, 'len' => mcfg }
          end
        end
      rescue => ex
        Rails.logger.error ex.message
        Rails.logger.error ex.backtrace
      end
    end
    
  end
end

ActiveRecord::Base.send :include, ActiveDirect::ActsAsDirect

