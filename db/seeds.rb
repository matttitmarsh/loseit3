AdminUser.create!(
  email: "admin@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: "wallwatcher"
)

puts "Admin user created"

User.create!(
  email: "normal@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: "normalwallwatcher"
)

puts "Normal user created"

Competition.create!(
  title: "Test Comp 1",
  start_date: Time.zone.now,
  finish_date: Time.zone.now,
  created_at: Time.zone.now,
  updated_at: Time.zone.now
)

puts "Competition created"

WeightRecord.create!(
  user_id: (User.find_by(email: "normal@test.com").id),
  competition_id: (Competition.find_by(title: "Test Comp 1").id),
  weight: 0.100e3,
  effective_date: Time.zone.now,
  created_at: Time.zone.now, updated_at: Time.zone.now
)

puts "Weight Record created"
