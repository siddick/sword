
module Sword
  module Generators
    module Helper
      private 
      def package_class_name
        @package_class_name ||= package_file_name.camelize
      end

      def package_file_name
        @package_file_name ||= package_name.gsub(/-/,'_')
      end

      def package_name
        gemspec_file = Dir[ Rails.root + '*.gemspec' ][0]
        if( gemspec_file ) 
          File.basename( gemspec_file ).sub( /\.gemspec$/, '' ).gsub(/-/,'_')
        else
          'sword_extra'
        end
      end
    end
  end
end
