require 'sword/hash'

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

      def expire_component
      end

      private

      def component_init
        @current_site = current_site
        @current_user = current_user
        @current_component = current_component
      end

      def component_layout
        layout_name = params[:layout] || "default"
        theme_name  = current_site.theme.name 
        return "themes/#{theme_name}/#{layout_name}"
      end

      def current_site
        session[:site] ||= 
          Site.find_by_host('*') || Site.find_by_host( request[:host] ) || Site.first
      end

      def current_user
        session[:user] ||=
          User.find_by_username( 'guest' )
      end

      def current_component
        ::Component.find_by_controller( params[:controller] )
      end

    end
  end
end
