class AddColumnsToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :end_estimated_time, :datetime
    add_column :attendances, :business_outline, :string
    add_column :attendances, :is_leaving_next_day, :boolean, default: false
    add_column :attendances, :approval_status, :integer, default: 0
  end
end
