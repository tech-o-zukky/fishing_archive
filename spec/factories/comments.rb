FactoryBot.define do
  factory :comment do
    comment_text               { Faker::Lorem.word }
    association :user
    association :record
  end
end
