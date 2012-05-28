class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :address

      t.timestamps
    end
  end
end
