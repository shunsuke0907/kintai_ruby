Base.create!(base_number: "A-1",
             base_name: "本店",
             attendance_type: "シフト制",)

User.create!(name:  "管理者",
             email: "admin@example.com",
             password:              "password",
             password_confirmation: "password",
             is_admin: true,
             base_id: 1)

59.times do |n|
  name  = Faker::Name.name
  email = "test#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
