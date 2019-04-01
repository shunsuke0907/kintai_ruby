class AttendancesController < ApplicationController
  
  def create
    @user = User.find(params[:user_id])
    @attendance = @user.attendances.find_by(worked_on: Date.today)
    if @attendance.started_at.nil?
      @attendance.update_attributes(started_at: current_time)
      flash[:info] = 'おはようございます。'
    elsif @attendance.finished_at.nil?
      @attendance.update_attributes(finished_at: current_time)
      flash[:info] = 'おつかれさまでした。'
    else
      flash[:danger] = 'トラブルがあり、登録出来ませんでした。'
    end
    redirect_to @user
  end
  
  def edit
    @user = User.find(params[:id])
    @first_day = first_day(params[:date])
    @last_day = @first_day.end_of_month
    @dates = user_attendances_month_date
  end
  
  def update
    @user = User.find(params[:id])
    if attendances_invalid?
      attendances_params.each do |id, item|
        attendance = Attendance.find(id)
        attendance.update_attributes(item)
      end
      flash[:success] = '勤怠情報を更新しました。'
      redirect_to user_path(@user, params:{first_day: params[:date]})
    else
      flash[:danger] = "不正な時間入力がありました、再入力してください。"
      redirect_to edit_attendances_path(@user, params[:date])
    end
  end
  
  def create_csv
    first_day = first_day(params[:date])
    last_day = first_day.end_of_month
    user = User.find(params[:id])
    @attendances = user.attendances.where('worked_on >= ? and worked_on <= ?', first_day, last_day).order('worked_on')

    respond_to do |format|
      format.csv do
        send_data render_to_string, filename: csv_file_name(user, first_day), type: :csv
      end
    end
  end
  
  def create_approval_status
    user = User.find(params[:id])
    target_day = first_day(params[:first_day])
    record = user.attendance_approval_requests.build(target_month: target_day, approval_status: 1, approver: params[:attendance_approval_request][:approver])

    if record.save
      superior = User.find(params[:attendance_approval_request][:approver])
      flash[:success] = "#{superior.name}上長に#{target_day.to_s(:year_month)}の勤怠承認を申請しました"
      redirect_to user
    else
      flash[:danger] = '勤怠の申請に失敗しました'
      redirect_to user
    end
  end
  
  def update_approval_status
    debugger
    first_day = first_day(params[:date])
    last_day = first_day.end_of_month
    user = User.find(params[:id])
    @attendances = user.attendances.where('worked_on >= ? and worked_on <= ?', first_day, last_day).order('worked_on')
    
  end
  
  private
  
    def attendances_params
      params.permit(attendances: [:started_at, :finished_at, :note])[:attendances]
    end
    
    def approval_status_params
      params.permit(attendances: [:approval_status, :approval_date, :approver])[:attendances]
    end
end
