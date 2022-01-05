class AddPriorityColumnToSkillList < ActiveRecord::Migration[6.1]
  def change
    add_column :skill_lists, :priority, :integer
    add_index :skill_lists, :priority
  end
end
