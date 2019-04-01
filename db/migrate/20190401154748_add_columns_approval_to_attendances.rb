class AddColumnsApprovalToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :approval_date, :date
    add_column :attendances, :approver, :integer
  end
end
