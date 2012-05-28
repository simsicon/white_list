class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.integer :domain_id
      t.string :ip
      t.string :port

      t.timestamps
    end
  end
end
