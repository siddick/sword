require 'rails/generators/active_record'

namespace :sword do
  desc "Sync themes and migration files."
  task :sync do  

    migrate_files = Dir[File.expand_path('../../../db/migrate/', __FILE__)+ "/*_sword_engine_*"]
    migrate_files.sort!

    dst_migration = "#{Rails.root}/db/migrate/"
    FileUtils.mkdir_p dst_migration
    migrate_files.each{|src_file|
      FileUtils.cp_r src_file, dst_migration
    }

    theme_files = Dir[File.expand_path('../../../public/theme/', __FILE__)+ "/*"]
    dst_theme = "#{Rails.root}/public/theme/"
    FileUtils.mkdir_p dst_theme
    theme_files.each{|src_file|
      FileUtils.cp_r src_file, dst_theme
    }

  end
end


