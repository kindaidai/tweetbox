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

class Authentication < ApplicationRecord
  belongs_to :user

  scope :twitter, -> { find_by(provider: 'twitter') }
end
