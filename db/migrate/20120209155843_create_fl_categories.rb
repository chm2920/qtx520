class CreateFlCategories < ActiveRecord::Migration
  def self.up
    create_table :fl_categories do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :fl_categories
  end
end
