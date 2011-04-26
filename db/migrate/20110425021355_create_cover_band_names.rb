class CreateCoverBandNames < ActiveRecord::Migration
  def self.up
    create_table :cover_band_names do |t|
      t.string :name
      t.string :band
      t.references :user
      t.integer :up_votes, :null => false, :default => 0
      t.integer :down_votes, :null => false, :default => 0
      t.timestamps
    end
    add_column :users, :up_votes, :integer, :null => false, :default => 0
    add_column :users, :down_votes, :integer, :null => false, :default => 0
    
  end

  def self.down
    remove_column :users, :down_votes
    remove_column :users, :up_votes
    drop_table :cover_band_names
  end
end
