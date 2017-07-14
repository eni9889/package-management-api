FactoryGirl.define do
  factory :package_version, class: Package::Version do
    package
    sequence(:version) { |n| "1.0.#{n}" }
  end
end