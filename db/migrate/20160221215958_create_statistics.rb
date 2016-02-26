class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.references :fighter, index: true, foreign_key: true
      t.integer :win
      t.integer :lost
      t.integer :experience

      t.timestamps null: false
    end
  end
end
