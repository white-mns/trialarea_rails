class CharaUseSkill < ApplicationRecord

def self.ransackable_attributes(auth_object = nil)
  column_names
end

def self.ransackable_associations(auth_object = nil)
  Array(reflect_on_all_associations).map(&:name).map(&:to_s)
end
  belongs_to :pc_name, :foreign_key => [:result_no, :round_no, :link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  belongs_to :seclusion_skill, :foreign_key => [:result_no, :seclusion_skill_id], :primary_key => [:result_no, :skill_id], :class_name => "SkillList"
end
