class ApplicationController < ActionController::Base
  def resultno_set
    @latest_result = Name.maximum("result_no")
    @latest_round = Name.where(result_no: @latest_result).maximum("round_no")
    @uploaded_result = UploadedCheck.maximum("result_no")
    @uploaded_round = UploadedCheck.where(result_no: @latest_result).maximum("result_no")
  end

  def placeholder_set
    @placeholder = {}
    @placeholder["Number"]    = "例）1~10/50~100"
    @placeholder["Text"]      = "例）武器/\"防具\""
    @placeholder["Name"]      = "例）太郎/\"次郎\""
    @placeholder["Skill"]     = "例）アタック/\"ファイア\""
    @placeholder["SkillText"] = "例）10点の物理攻撃/この攻撃によって"
    @placeholder["Item"]      = "例）武器/\"防具\""
  end

  def skill_data_set
    skill_list_text = []
    skill_list = SkillList.pluck(:name, :ap, :priority, :text)

    skill_list.each do |skill_data|
      skill_text = ""
      if skill_data[1].present? && skill_data[1] > -100 then skill_text += "AP " + sprintf("%d", skill_data[1]) end
      if skill_data[2].present? && skill_data[2] > -100 then skill_text += " 優先度 " + sprintf("%d", skill_data[2]) end
      if skill_data[1].present? && skill_data[1] > -100 then skill_text += "<br>" end
      skill_text += skill_data[3]
      skill_list_text.push([skill_data[0], skill_text])
    end

    @skill_data = Hash[*skill_list_text.flatten]
  end
end
