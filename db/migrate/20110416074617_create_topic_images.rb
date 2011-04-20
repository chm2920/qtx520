class CreateTopicImages < ActiveRecord::Migration
  def self.up
    create_table :topic_images do |t|
      t.integer :topic_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :topic_images
  end
end
