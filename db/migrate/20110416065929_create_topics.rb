class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :node_id
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :city
      t.string :validate_date
      t.string :contact
      t.string :phone
      t.string :qq
      t.string :email
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
