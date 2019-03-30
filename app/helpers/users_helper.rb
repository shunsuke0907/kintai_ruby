module UsersHelper
  
  # 管理者かどうか確認（管理者の場合はtrueを返す）
  def is_admin?
    res = current_user.present? ? current_user[:is_admin] : false;
    return res
  end
  
  # 基本時間などの値を、指定の書式にフォーマットして返す
  def format_basic_time(datetime)
    format("%.2f", ((datetime.hour * 60) + datetime.min)/60.0)
  end
end
