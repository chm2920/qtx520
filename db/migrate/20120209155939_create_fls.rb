class CreateFls < ActiveRecord::Migration
  def self.up
    create_table :fls do |t|
      t.integer :fl_category_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :fls
  end
end
