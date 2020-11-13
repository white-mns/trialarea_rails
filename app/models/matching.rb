class Matching < ApplicationRecord
  belongs_to :left_pc_name,  :foreign_key => [:result_no, :round_no, :left_link_no],  :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  belongs_to :right_pc_name, :foreign_key => [:result_no, :round_no, :right_link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  belongs_to :left_skills,  :foreign_key => [:result_no, :round_no, :left_link_no],  :primary_key => [:result_no, :round_no, :link_no], :class_name => "SkillConcatenate"
  belongs_to :right_skills, :foreign_key => [:result_no, :round_no, :right_link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "SkillConcatenate"
  # Ransack issue #1119 のエラーを回避するために検索用にhas_manyで関連付ける(同じテーブルを複数(左右キャラクター)結合し、それらにorで検索をかける際にエラーとなる)
  has_many :left_searchs,  :foreign_key => [:result_no, :round_no, :link_no], :primary_key => [:result_no, :round_no, :left_link_no],  :class_name => "SkillConcatenate"
  has_many :right_searchs, :foreign_key => [:result_no, :round_no, :link_no], :primary_key => [:result_no, :round_no, :right_link_no], :class_name => "SkillConcatenate"
end
