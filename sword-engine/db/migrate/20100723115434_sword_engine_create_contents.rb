class SwordEngineCreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :type
      t.text :data
      t.string :version
      t.integer :latest_content_id

      t.timestamps
    end

  end

  def self.down
    drop_table :contents
  end
end
