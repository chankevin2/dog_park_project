require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :park do
    sequence(:name) {|name| "#{name} Park" }
    sequence(:address) {|address| "#{address} Main Street" }
    city {"Boston"}
    state {"MA"}
    zip {"01103"}
    description {"Yankees suck"}
  end

end
