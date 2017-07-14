FactoryGirl.define do
  factory :developer do
    name Faker::Name.name
    sequence(:contact_info) { |n| { emails: [{ name: name, email: "john#{n}@example.com"}] } }
  end
end