class AddIndexToSkill < ActiveRecord::Migration[6.0]
  def change
    add_index :skills, [:result_no, :round_no, :link_no, :skill_id], :unique => false, :name => 'resultno_linkno'
    add_index :skills, [:result_no, :skill_id], :unique => false, :name => 'resultno_skillid'
  end
end
