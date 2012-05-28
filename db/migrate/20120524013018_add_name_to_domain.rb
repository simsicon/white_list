class AddNameToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :name, :string
  end
end
