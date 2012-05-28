class CreateSshes < ActiveRecord::Migration
  def change
    create_table :sshes do |t|

      t.timestamps
    end
  end
end
