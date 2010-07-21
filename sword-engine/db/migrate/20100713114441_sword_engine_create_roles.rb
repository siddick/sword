class SwordEngineCreateRoles < ActiveRecord::Migration
  def self.up

    create_table :roles do |t|
      t.string :name, :unique => true
      t.string :description
      t.boolean :frozen_role, :default => false

      t.timestamps
    end

    Role.create!( :name => "admin", :description => "Administrator role", :frozen_role => true )
    Role.create!( :name => "guest", :description => "guest role", :frozen_role => true )
    Role.create!( :name => "login", :description => "authenticate role", :frozen_role => true )

  end

  def self.down
    drop_table :roles
  end
end
