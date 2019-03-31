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
  
  # 該当ユーザーの役職が英語で欲しい時に変換して返す
  def position_in_english(user)
    return nil if user.nil?
    case user.position
    when '一般'
      return 'user'
    when '上長'
      return 'supervisor'
    when '管理者'
      return 'admin'
    else
      return nil
    end
  end
end