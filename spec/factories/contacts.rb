require 'faker'

FactoryGirl.define do
  factory :contact do |f|
    f.firstname { Faker::Name.first_name }
    f.lastname { Faker::Name.last_name }
  end
end
