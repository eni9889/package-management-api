FactoryGirl.define do
  factory :developer_identifier do
    developer
    sequence(:identifier) { |n| "dev#{n}" }
    identifier_type 'dev_id'
    download_stats  { {} }
  end
end
