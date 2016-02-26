class CreateFighterData < ActiveRecord::Migration
  def change
    create_table :fighter_data do |t|

      t.timestamps null: false
    end
  end
end
