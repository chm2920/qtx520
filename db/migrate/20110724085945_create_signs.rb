class CreateSigns < ActiveRecord::Migration
  def self.up
    create_table :signs do |t|
      t.integer :sign_category_id
      t.string :vs
    end
  end

  def self.down
    drop_table :signs
  end
end
