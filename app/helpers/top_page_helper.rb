module TopPageHelper
  def top_text(result_no, round_no, uploaded)
    if !result_no then return "" end

    text = "第" + sprintf("%d", result_no) + "回大会 " + sprintf("%d", round_no) + "回戦"

    if result_no == uploaded then
        text += "まで反映済です。"
    else
        text += "のデータに更新中です…"
    end

    text
  end
end
