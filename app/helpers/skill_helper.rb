module SkillHelper
  def skill_rate_text(skill, maxes)
    text = ""
    unless skill then return text end
    unless maxes then return text end
    unless maxes[[skill.result_no, skill.round_no]] then return text end

    text = sprintf("%d %%", skill.user_count / maxes[[skill.result_no, skill.round_no]].to_f * 100)

    return text
  end
end
