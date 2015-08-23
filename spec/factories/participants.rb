require 'ffaker'

FactoryGirl.define do
  factory :participant do
    first_name FFaker::NameSE.first_name
    last_name FFaker::NameSE.last_name
    display_name { [first_name, last_name].join(' ') }
    sequence(:email) { |n| [first_name, last_name].join('.') + "-#{n}@example.com" }
  end
end
