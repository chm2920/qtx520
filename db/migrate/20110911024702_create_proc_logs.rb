class CreateProcLogs < ActiveRecord::Migration
  def self.up
    create_table :proc_logs do |t|
      t.string :method
      t.string :url
      t.string :ip
      t.string :visit_time
      t.string :completed
      t.string :views
      t.string :activerecord

      t.timestamps
    end
  end

  def self.down
    drop_table :proc_logs
  end
end
