class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :base_id, :integer
    add_column :users, :position, :integer, default: 0
    add_column :users, :employee_number, :string
    add_column :users, :card_number, :string
    add_column :users, :designated_working_start_time, :datetime
    add_column :users, :designated_working_end_time, :datetime
  end
end
