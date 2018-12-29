# == Schema Information
#
# Table name: users
#
#  id          :bigint(8)        not null, primary key
#  screen_name :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :user do
    sequence(:screen_name) { Faker::Twitter.screen_name }
    after(:create) do |user|
      create_list(:authentication, 1, :twitter, user: user)
    end
  end
end
