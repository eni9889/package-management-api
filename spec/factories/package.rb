FactoryGirl.define do
  factory :package do
    repository
    author            { |a| a.association(:package_author) }
    name 'com.sample.app'
  end
end