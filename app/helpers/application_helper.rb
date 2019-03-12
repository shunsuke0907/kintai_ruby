module ApplicationHelper
  
  # ページごとに条件に応じて整形したタイトルを返す
  # params string page_title 表示するページのタイトル
  # return string 整形したタイトル
  def full_title(page_title = "")
    base_title = "勤怠管理システム"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
