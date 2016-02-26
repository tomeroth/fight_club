class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :fighter, index: true, foreign_key: true
      t.integer :skill_type
      t.integer :level, :default => 1

      t.timestamps null: false
    end
  end
end
