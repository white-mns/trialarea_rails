class AddIndexToAllUseSkill < ActiveRecord::Migration[6.0]
  def change
    add_index :all_use_skills, [:result_no, :round_no, :battle_no], :unique => false, :name => 'resultno_battleno'
  end
end
