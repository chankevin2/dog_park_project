require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end

    factory :park do
      sequence(:name) {|n| "#{n}" }
      sequence(:address) {|n| "#{n}" }
      sequence(:city) {|n| "#{n}" }
      sequence(:state) {|n| "#{n}" }
      sequence(:zip) {|n| "#{n}" }
      sequence(:description) {|n| "#{n}" }

    end
end
