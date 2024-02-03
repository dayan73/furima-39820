require 'faker'

FactoryBot.define do
  factory :item do
    trade_name        { Faker::Commerce.product_name }
    description       { Faker::Lorem.sentence }
    price             { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    state_id          { 2 }
    postage_id        { 2 }
    region_id         { 8 }
    transit_time_id   { 2 }
    category_id       { 2 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
