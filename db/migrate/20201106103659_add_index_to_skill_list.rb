class AddIndexToSkillList < ActiveRecord::Migration[6.0]
  def change
    add_index :skill_lists, [:result_no, :skill_id], :unique => false, :name => 'resultno_skillid'
    add_index :skill_lists, [:result_no, :name], :unique => false, :name => 'resultno_name'
    add_index :skill_lists, :skill_id
    add_index :skill_lists, :name
    add_index :skill_lists, :skill_type
    add_index :skill_lists, :ap
    add_index :skill_lists, :is_physics
    add_index :skill_lists, :is_fire
    add_index :skill_lists, :is_aqua
    add_index :skill_lists, :is_wind
    add_index :skill_lists, :is_quake
    add_index :skill_lists, :is_light
    add_index :skill_lists, :is_dark
    add_index :skill_lists, :is_poison
  end
end
