Base.create!(base_number: "A-1",
             base_name: "本店",
             attendance_type: "シフト制",)

User.create!(name:  "管理者",
             email: "admin@example.com",
             department: 'テスト事業部',
             employee_number: "admin-01",
             card_number: 'ADMIN9001',
             basic_time: '08:00',
             designated_working_start_time: '09:00',
             designated_working_end_time: '18:00',
             password:              "password",
             password_confirmation: "password",
             is_admin: true,
             base_id: 1)

7.times do |n|
  name  = Faker::Name.name
  email = "supervisor#{n+1}@example.com"
  card_number = n+1 >= 10 ? "TEST00#{n+1}" : "TEST000#{n+1}";
  password = 'password'
  User.create!(name:  name,
               email: email,
               department: 'テスト事業部',
               employee_number: "test-#{n+1}",
               card_number: card_number,
               basic_time: '08:00',
               designated_working_start_time: '09:00',
               designated_working_end_time: '18:00',
               position: 1,
               password:              password,
               password_confirmation: password,
               base_id: 1)
end

32.times do |n|
  name  = Faker::Name.name
  email = "user#{n+8}@example.com"
  card_number = n+8 >= 10 ? "TEST00#{n+8}" : "TEST000#{n+8}";
  password = 'password'
  User.create!(name:  name,
               email: email,
               department: 'テスト事業部',
               employee_number: "test-#{n+8}",
               card_number: card_number,
               basic_time: '08:00',
               designated_working_start_time: '09:00',
               designated_working_end_time: '18:00',
               password:              password,
               password_confirmation: password,
               base_id: 1)
end
