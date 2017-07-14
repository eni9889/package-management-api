FactoryGirl.define do
  factory :package_author, class: 'Package::Author' do
    name             Faker::Name.name
    sequence(:email) { |n| "john#{n}@example.com" }
    dev_id           Faker::Name.name.downcase
  end
end