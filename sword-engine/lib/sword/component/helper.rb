module Sword
  module Component
    module Helper
      
      def self.cache_component( options )
        proc_object =  Proc.new { |c|
          c.send( :generate_component_cache_url )
        }

        caches_action :index, :cache_path => proc_object
        caches_action :show, :cache_path => proc_object
        caches_action :edit, :cache_path => proc_object
      end

      private
      def expire_component
      end

      def current_site
        # For Testing
        @site ||= Struct.new( :name, :host, :options ).new( "default", "*", { :site_name => "SIDDICK.COM" } )
      end

      def current_user
        # For Testing
        @user ||= Struct.new( :username, :roles, :options  ).new( "guest", [ "guest" ], {} )
      end

    end
  end
end
