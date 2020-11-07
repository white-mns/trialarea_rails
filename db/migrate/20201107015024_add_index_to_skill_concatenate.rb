class AddIndexToSkillConcatenate < ActiveRecord::Migration[6.0]
  def change
    add_index :skill_concatenates, [:result_no, :round_no, :link_no], :unique => false, :name => 'resultno_linkno'
  end
end
