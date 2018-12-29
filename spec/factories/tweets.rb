# == Schema Information
#
# Table name: tweets
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  tweet_id   :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :tweet do
    
  end
end
