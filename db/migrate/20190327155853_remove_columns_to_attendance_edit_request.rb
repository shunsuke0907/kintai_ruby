class RemoveColumnsToAttendanceEditRequest < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendance_edit_requests, :is_leaving_next_day, :string
    remove_column :attendance_edit_requests, :approval_status, :string
  end
end
