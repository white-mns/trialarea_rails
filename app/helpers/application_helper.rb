module ApplicationHelper
  def site_title
    title = "試行策謀データ小屋"
    title
  end

  def page_title
    title = site_title
    title = @page_title + " | " + title if @page_title
    title
  end

  def uploading_alert(latest_result, uploaded_result)
    if latest_result == uploaded_result then
      return
    end

    haml_tag :div, class: "alert alert-dismissible alert-danger" do
      haml_concat "現在データの更新中です。"
      haml_tag :button, type: "button", class: "close", data: {dismiss: "alert"} do
        haml_concat fa_icon "times"
      end
    end
  end

  def pc_name_text(pc_name)
    unless pc_name then return end

    result_no_text = sprintf("%d", pc_name.result_no)
    round_no_text = sprintf("%d", pc_name.round_no)
    link_no_text = sprintf("%d", pc_name.link_no)

    text = ""
    player_id_text = " [PL:" + sprintf("%d", pc_name.player_id) + "]"

    text = (pc_name) ? pc_name.name.html_safe + player_id_text : player_id_text
    haml_tag :a, href: "https://gameokiba.com/trialandscheme/result_charalist/" + result_no_text + "/" + round_no_text + "#"+ link_no_text, target: "_blank" do
      haml_concat text
    end
  end

  def player_name_text(player_id, pc_name)
    player_id_text = " [" + sprintf("%d",player_id) + "]"
    if pc_name then
      pc_name.player.html_safe + player_id_text
    else
      player_id_text
    end
  end

  def character_link(result_no, round_no, link_no)
    if link_no <= 0 then return end

    result_no_text = sprintf("%d", result_no)
    round_no_text = sprintf("%d", round_no)
    link_no_text = sprintf("%d", link_no)

    link_to " キャラクター", "https://gameokiba.com/trialandscheme/result_charalist/" + result_no_text + "/" + round_no_text + "#"+ link_no_text, :target => "_blank"
  end

  def battle_link(battle_no, page_type)
    if battle_no <= 0 then return end

    battle_no_text = sprintf("%d", battle_no)
    page_type_text = sprintf("%d", page_type)

    link_text = (page_type == 1) ? "対戦結果表示" : (page_type == 2) ? "ログのみ" : (page_type == 3) ? "コメント付" : "";

    link_to link_text, "https://gameokiba.com/trialandscheme/battle/" + battle_no_text + "/" + page_type_text, :target => "_blank"
  end


  def search_submit_button()
    haml_tag :button, class: "btn btn-outline-search", type: "submit" do
      haml_concat fa_icon "search", text: "検索する"
    end
  end

  def ex_sort_text(params, sort_column, text)
    if params["ex_sort"] == "on" && params["ex_sort_text"] && params["ex_sort_text"].include?(sort_column) then
      if params["ex_sort_text"].include?("desc")
        text = text + "▼"
      else
        text = text + "▲"
      end
    end
    text
  end

  def help_icon()
    haml_concat fa_icon "question-circle"
  end

  def act_desc(is_opened)
    desc        = is_opened ? "（クリックで閉じます）" : "（クリックで開きます）"
    desc_closed = is_opened ? "（クリックで開きます）" : "（クリックで閉じます）"

    haml_tag :span, class: "act_desc" do
      haml_concat desc
    end

    haml_tag :span, class: "act_desc closed" do
      haml_concat desc_closed
    end
  end

  def act_icon(is_opened)
    icon        = is_opened ? "times" : "plus"
    icon_closed = is_opened ? "plus"  : "times"

    haml_tag :span, class: "act_desc" do
      haml_concat fa_icon icon, class: "fa-lg"
    end

    haml_tag :span, class: "act_desc closed" do
      haml_concat fa_icon icon_closed, class: "fa-lg"
    end
  end

  def td_form(f, form_params, placeholders, class_name: nil, colspan: nil, label: nil, params_name: nil, placeholder: nil, checkboxes: nil, label_td_class_name: nil)
    haml_tag :td, class: label_td_class_name do
      if label then
        haml_concat f.label params_name.to_sym, label
      end
    end

    # テキストフォームの描画
    if !class_name.nil? && !params_name.nil?  then
      td_text_form(f, form_params, placeholders, class_name: class_name, colspan: colspan, params_name: params_name, placeholder: placeholder)
    end

    # チェックボックス選択フォームの描画
    if !checkboxes.nil?  then
      td_text_checkbox(f, form_params, placeholders, class_name: class_name, colspan: colspan, checkboxes: checkboxes)
    end
  end

  def td_text_form(f, form_params, placeholders, class_name: nil, colspan: nil, params_name: nil, placeholder: nil)
    haml_tag :td, class: class_name, colspan: colspan do
      haml_concat text_field_tag params_name.to_sym, form_params[params_name], placeholder: placeholders[placeholder]
    end
  end

  def td_text_checkbox(f, form_params, placeholders, class_name: nil, colspan: nil, checkboxes: [])
    haml_tag :td, class: class_name, colspan: colspan do
      checkboxes.each do |hash|
        # チェックボックスの描画
        if !hash[:params_name].nil? then
          haml_tag :span, class: hash[:class_name] do
            haml_concat check_box_tag hash[:params_name].to_sym, form_params[hash[:params_name]], form_params[hash[:params_name]]
            haml_concat label_tag hash[:params_name].to_sym, hash[:label]
          end
        end

        # 改行指定
        if hash[:br] then
          haml_tag :br
        end
      end
    end
  end

  def tbody_toggle(form_params, params_name: nil, label: {open: "", close: ""}, act_desc: nil, base_first: false)
    haml_tag :tbody, class: "tbody_toggle pointer"do
      haml_tag :tr do
        haml_tag :td, colspan: 5 do
          if base_first then
            haml_concat hidden_field_tag :base_first, form_params["base_first"]
          end

          haml_concat hidden_field_tag params_name.to_sym, form_params[params_name]

          act_icon(false)

          haml_concat label_tag params_name.to_sym, "　" + label[:open],  class: "act_desc"
          haml_concat label_tag params_name.to_sym, "　" + label[:close], class: "act_desc closed"
          if act_desc then
            haml_tag :div, class: "act_desc" do
              haml_concat "　" + act_desc
            end
          end
        end
      end
    end
  end

  def skill_type_text(skill_type)
    unless skill_type then return end

    if    skill_type == 0 then return "スキル"
    elsif skill_type == 1 then return "アビリティ"
    elsif skill_type == 2 then return "覚醒"
    else return ""
    end
  end

  def skill_concatenate_text(text, skill_data)
    skill_array = text.split(",")
    skill_array.each do |skill_info|
      if skill_info == "" then next end

      skill_info_array = skill_info.split(" ")
      skill_name = skill_info_array[0]
      skill_count = skill_info_array[0]

      span_attr = {data: {bs: {toggle: "tooltip", placement: "right"}}, title: skill_data[skill_name]}

      if skill_name[0] == "!"
        skill_info.slice!(0,1)
        skill_name.slice!(0,1)
        span_attr[:class] = "fw-bold"
      end

      span_attr[:title] = skill_data[skill_name]

      haml_tag :span, span_attr do
        haml_concat skill_info
      end

      haml_tag :br
    end
  end
end
