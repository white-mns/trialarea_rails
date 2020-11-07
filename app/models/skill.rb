class Skill < ApplicationRecord
  belongs_to :pc_name, :foreign_key => [:result_no, :round_no, :link_no], :primary_key => [:result_no, :round_no, :link_no], :class_name => "Name"
  belongs_to :skill, :foreign_key => [:result_no, :skill_id], :primary_key => [:result_no, :skill_id], :class_name => "SkillList"

  scope :groups, ->(params) {
    if params["show_total"] == "1"
      group("skills.result_no").
      group("skills.round_no").
      group("skills.skill_id")
    end
  }

  scope :aggregations, ->(params) {
    if params["show_total"] == "1"
      select("*").
      select("COUNT(skills.id) AS user_count")
    end
  }

  scope :having_order, ->(params) {
    ex_sorts = {"user_count desc" => 1}
    if !params[:q][:s]
      params["ex_sort_text"] = "user_count desc"
      return order("user_count desc")

    elsif ex_sorts.has_key?(params[:q][:s])
      sort = params[:q][:s]
      params[:q].delete(:s)
      params["ex_sort"] = "on"
      params["ex_sort_text"] = sort
      return order(sort)

    else
      params["ex_sort_text"] = ""
    end

    return nil
  }
end
