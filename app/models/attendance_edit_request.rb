class AttendanceEditRequest < ApplicationRecord
  belongs_to :user
  
  enum position:{'なし': 0, '申請中': 1, '承認': 2, '否認': 3}
end
