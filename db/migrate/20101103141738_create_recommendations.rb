class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.integer :position, :null => false, :default => 1
      t.string :name, :null => false, :limit => 64
      t.string :title, :null => false, :limit => 128
      t.string :company, :null => false, :limit => 128
      t.string :company_url, :limit => 255
      t.string :body, :null => false, :limit => 2000
      
      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end
