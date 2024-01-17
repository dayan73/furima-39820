require 'faker'

FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 { Faker::Internet.email }
    password              {'000000'}
    password_confirmation {password}
    last_name              {'田中'}
    first_name             {'太郎'}
    phonetic_last_name     {'タナカ'}
    phonetic_first_name    {'タロウ'}
    birthday               {'1981-12-24'}
  end
end