class AddSkillConcatenateExAndSeclusionSkillIdColumnToCharaUseSkill < ActiveRecord::Migration[6.0]
  def change
    add_column :chara_use_skills, :skill_concatenate_ex, :string
    add_column :chara_use_skills, :seclusion_skill_id, :integer
  end
end
