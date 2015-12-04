class AddUserRefToPersonas < ActiveRecord::Migration
  def change
    add_reference :personas, :user, index: true
    add_foreign_key :personas, :users
  end
end
