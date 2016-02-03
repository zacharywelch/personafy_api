class RemoveUserRefFromPersonas < ActiveRecord::Migration
  def change
    remove_reference :personas, :user, index: true
    remove_foreign_key :personas, :users
  end
end
