class Tweet < ApplicationRecord
  belongs_to :user

  validates :tweet_id, numericality: { other_than: 0 }
end
