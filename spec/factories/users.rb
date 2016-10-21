FactoryGirl.define do
  factory :user do
    provider "google"
    sequence(:uid) { |n| n }
    name "Mira Grant"
  end
end
