class CreateSkillLists < ActiveRecord::Migration[6.0]
  def change
    create_table :skill_lists do |t|
      t.integer :skill_id
      t.string :name
      t.integer :result_no
      t.integer :skill_type
      t.integer :ap
      t.string :text
      t.integer :is_physics
      t.integer :is_fire
      t.integer :is_aqua
      t.integer :is_wind
      t.integer :is_quake
      t.integer :is_light
      t.integer :is_dark
      t.integer :is_poison

      t.timestamps
    end
  end
end
