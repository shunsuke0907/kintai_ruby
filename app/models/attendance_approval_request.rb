class AttendanceApprovalRequest < ApplicationRecord
  belongs_to :user
  
  enum approval_status:{'なし': 0, '申請中': 1, '承認': 2, '否認': 3}
end
