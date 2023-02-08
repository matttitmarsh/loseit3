FactoryBot.define do
  factory :admin_user do
    sequence(:name) { |n| "admin#{n}" }
    sequence(:email) { |n| "admin#{n}@admin.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
