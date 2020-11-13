class AddIndexToCharaUseSkill < ActiveRecord::Migration[6.0]
  def change
    add_index :chara_use_skills, [:result_no, :round_no, :battle_no, :link_no], :unique => false, :name => 'resultno_battleno_linkno'
    add_index :chara_use_skills, [:result_no, :round_no, :link_no], :unique => false, :name => 'resultno_linkno'
  end
end
