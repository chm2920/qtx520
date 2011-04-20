class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :node_id
      t.string :name
    end
  end

  def self.down
    drop_table :categories
  end
end
