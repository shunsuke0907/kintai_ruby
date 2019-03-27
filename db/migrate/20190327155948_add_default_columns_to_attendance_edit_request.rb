class AddDefaultColumnsToAttendanceEditRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_edit_requests, :is_leaving_next_day, :boolean, default: false
    add_column :attendance_edit_requests, :approval_status, :integer, default: 0
  end
end
