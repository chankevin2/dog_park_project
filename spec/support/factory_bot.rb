require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :park do
    sequence(:name) {|name| name }
    sequence(:address) {|address| address }
    sequence(:city) {|city| city }
    sequence(:state) {|state| state }
    sequence(:zip) {|zip| zip }
    sequence(:description) {|description| description }
  end
end
