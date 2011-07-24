class CreateSignCategories < ActiveRecord::Migration
  def self.up
    create_table :sign_categories do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :sign_categories
  end
end
