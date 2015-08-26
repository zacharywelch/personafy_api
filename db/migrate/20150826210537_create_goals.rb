class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
      t.references :persona, index: true

      t.timestamps null: false
    end
    add_foreign_key :goals, :personas
  end
end
