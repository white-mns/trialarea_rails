class CharaUseSkill < ApplicationRecord
  belongs_to :pc_name, :foreign_key => [:result_no, :round_no, :link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  belongs_to :seclusion_skill, :foreign_key => [:result_no, :seclusion_skill_id], :primary_key => [:result_no, :skill_id], :class_name => "SkillList"
end
