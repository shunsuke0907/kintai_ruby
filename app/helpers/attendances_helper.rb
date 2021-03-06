module AttendancesHelper
  
  def current_time
    Time.new(
      Time.now.year,
      Time.now.month,
      Time.now.day,
      Time.now.hour,
      Time.now.min, 0
    )
  end
  
  def working_times(started_at, finished_at)
    format("%.2f", (((finished_at - started_at) / 60) / 60.0))
  end
  
  def working_times_sum(seconds)
    format("%.2f", seconds / 60 / 60.0)
  end
  
  def first_day(date)
    !date.nil? ? Date.parse(date) : Date.current.beginning_of_month
  end
  
  def user_attendances_month_date
    @user.attendances.where('worked_on >= ? and worked_on <= ?', @first_day, @last_day).order('worked_on')
  end
  
  def attendances_invalid?
    attendances = true
    attendances_params.each do |id, item|
      if item[:started_at].blank? && item[:finished_at].blank?
        next
      elsif item[:started_at].blank? || item[:finished_at].blank?
        attendances = false
        break
      elsif item[:started_at] > item[:finished_at]
        attendances = false
        break
      end
    end
  end
  
  def csv_file_name(user, date)
    "user_id_#{user.id}_#{date.strftime('%Y_%m')}.csv"
  end
  
  # 出勤中になっているユーザーのIDを取得
  def working_on_user_ids
    Attendance.where.not(started_at: nil).where(finished_at: nil).pluck('user_id')
  end
  
  # 対象ユーザーの指定の月の勤怠の承認ステータスを取得
  def approval_status(user_id, target_month)
    data = AttendanceApprovalRequest.find_by(user_id: user_id, target_month: target_month)
    return data.nil? ? nil : data.approval_status;
  end
end
