module Sword
  module SiteTemplate
    module <%= template_class_name %>
      def self.create( site )
        page = Page.create!( :header => "Testing" )
        SitePageMap.create!( :page_id => page.id, :site_id => site.id )
      end

      def self.destroy( site )
      end
    end
  end
end
