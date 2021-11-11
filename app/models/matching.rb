class Matching < ApplicationRecord
  belongs_to :left_pc_name,  :foreign_key => [:result_no, :round_no, :left_link_no],  :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  belongs_to :right_pc_name, :foreign_key => [:result_no, :round_no, :right_link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  belongs_to :left_skills,  :foreign_key => [:result_no, :round_no, :left_link_no],  :primary_key => [:result_no, :round_no, :link_no], :class_name => "SkillConcatenate"
  belongs_to :right_skills, :foreign_key => [:result_no, :round_no, :right_link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "SkillConcatenate"
  belongs_to :all_use_skill, :foreign_key => [:result_no, :round_no, :battle_no],  :primary_key => [:result_no, :round_no, :battle_no], :class_name => "AllUseSkill"
  belongs_to :left_use_skills,  :foreign_key => [:result_no, :round_no, :left_link_no],  :primary_key => [:result_no, :round_no, :link_no], :class_name => "CharaUseSkill"
  belongs_to :right_use_skills, :foreign_key => [:result_no, :round_no, :right_link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "CharaUseSkill"
end
