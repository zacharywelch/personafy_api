class AddRoleToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :role, :string
  end
end
