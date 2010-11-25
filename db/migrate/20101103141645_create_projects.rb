class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :position, :null => false, :default => 1
      t.string :title, :null => false, :limit => 128
      t.string :url, :null => false, :limit => 255
      t.string :intro, :null => false, :limit => 255
      t.text :description, :null => false
      t.string :meta_title, :limit => 255
      t.string :meta_keywords, :limit => 255
      t.string :meta_description, :limit => 255
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      
      t.string :cached_slug # for friendly_id caching
      
      t.timestamps
    end
    
    add_index :projects, :cached_slug
  end

  def self.down
    drop_table :projects
  end
end
