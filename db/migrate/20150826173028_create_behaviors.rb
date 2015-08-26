class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.string :description
      t.references :persona, index: true

      t.timestamps null: false
    end
    add_foreign_key :behaviors, :personas
  end
end
