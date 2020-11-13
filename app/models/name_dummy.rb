class NameDummy < ApplicationRecord
  has_many :pc_name, :foreign_key => [:result_no, :round_no, :link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  has_many :skills,  :foreign_key => [:result_no, :round_no, :link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "SkillConcatenate"
end
