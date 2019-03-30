class User < ApplicationRecord
  require 'csv'
  
  has_many :attendances, dependent: :destroy
  has_many :attendance_edit_requests, dependent: :destroy
  
  belongs_to :base, optional: true
  
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :department, length: { in: 3..50 }, allow_blank: true
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      obj = new
      obj.attributes = row.to_hash.slice(*updatable_attributes)
      obj.save!
    end
  end

  def self.updatable_attributes
    [
      'name',
      'email',
      'department',
      'employee_number',
      'card_number',
      'basic_time',
      'designated_working_start_time',
      'designated_working_end_time',
      'position',
      'is_admin',
      'password'
    ]
  end
end
