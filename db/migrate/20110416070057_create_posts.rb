class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
