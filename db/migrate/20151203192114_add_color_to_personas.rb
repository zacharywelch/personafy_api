class AddColorToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :color, :string
  end
end
