class CreateAttendanceEditRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_edit_requests do |t|
      t.date :worked_on
      t.datetime :before_change_started_at
      t.datetime :before_change_finished_at
      t.datetime :after_change_started_at
      t.datetime :after_change_finished_at
      t.boolean :is_leaving_next_day
      t.integer :approval_status
      t.date :approval_date
      t.integer :approver
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
