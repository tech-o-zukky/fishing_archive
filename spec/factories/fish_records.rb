FactoryBot.define do
  factory :fish_record do
    title               { Faker::Lorem.word }
    date                { Faker::Date.between(from: '1999-04-01', to: '2020-11-30') }
    prefecture_id       { Faker::Number.within(range: 1..48) }
    area                { Faker::Lorem.word }
    place               { Faker::Lorem.word }
    timing1             { Faker::Number.within(range: 0..1) }
    timing2             { Faker::Number.within(range: 0..1) }
    timing3             { Faker::Number.within(range: 0..1) }
    timing4             { Faker::Number.within(range: 0..1) }
    timing5             { Faker::Number.within(range: 0..1) }
    timing6             { Faker::Number.within(range: 0..1) }
    timing7             { Faker::Number.within(range: 0..1) }
    weather_id          { Faker::Number.within(range: 0..17) }
    wind_id             { Faker::Number.within(range: 0..5) }
    temperature         { Faker::Number.decimal(l_digits: 1) }
    water_temperature   { Faker::Number.decimal(l_digits: 1) }
    wave_id             { Faker::Number.within(range: 0..9) }
    water_quality_id    { Faker::Number.within(range: 0..4) }
    tide_id             { Faker::Number.within(range: 0..5) }

    fish_name           { Faker::Lorem.word }
    fish_count          { Faker::Number.within(range: 0..200) }

    content             { Faker::Lorem.sentence }
  end
end
