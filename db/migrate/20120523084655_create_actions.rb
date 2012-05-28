class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.text :description
      t.string :command

      t.timestamps
    end
  end
end
