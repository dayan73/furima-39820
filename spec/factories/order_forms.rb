require 'faker'

FactoryBot.define do
  factory :order_form do
    zip_code          { '123-4567' }       
    region_id         { 2 }
    city              { Faker::Address.city }  
    house_number      { Faker::Address.street_address } 
    building          { Faker::Address.secondary_address } 
    phone_number      { '09012345678' } 
    token {"tok_abcdefghijk00000000000000000"}

  end
end
  