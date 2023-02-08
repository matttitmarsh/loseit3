FactoryBot.define do
  factory :competition do
    sequence(:title) { |n| "Competition #{n}" }
    start_date { Time.zone.now }
    finish_date { Time.zone.now }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
