class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :avatar

      t.timestamps null: false
    end
  end
end
