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

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
