class CreateAttendanceApprovalRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_approval_requests do |t|
      t.date :target_month
      t.integer :approval_status, default: 0
      t.date :approval_date
      t.integer :approver
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
