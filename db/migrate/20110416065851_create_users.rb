class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.integer :login_times
      t.integer :coins
      t.string :qq
      t.string :phone
      t.string :realname
      t.string :city
      t.string :address
      t.string :sign

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
