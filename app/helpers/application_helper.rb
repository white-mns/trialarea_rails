module ApplicationHelper
  def page_title
    title = "定期更新ゲーム過去結果データ小屋"
    title = @page_title + " | " + title if @page_title
    title
  end
end
