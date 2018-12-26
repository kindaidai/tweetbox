# == Schema Information
#
# Table name: authentications
#
#  id                  :bigint(8)        not null, primary key
#  user_id             :integer          not null
#  provider            :string(255)      not null
#  uid                 :string(255)      not null
#  access_token        :string(255)
#  access_token_secret :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryBot.define do
  factory :authentication do
    user
    provider { 'twitter' }
    uid { Faker::Twitter.user[:id] }
    access_token { 'dummy_access_token' }
    access_token_secret { 'dummy_access_token_secret' }

    trait :twitter do
      provider { 'twitter' }
    end
  end
end
