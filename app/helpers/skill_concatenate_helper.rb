module SkillConcatenateHelper
  def skill_concatenate_text(text)
    skill_array = text.split(",")
    skill_array.each do |skill_name|
        if skill_name == "" then next end
        haml_concat skill_name
        haml_tag :br
    end
  end
end
