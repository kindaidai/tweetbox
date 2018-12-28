class TwitterManager
  attr_reader :client

  def initialize(user)
    auth = user.authentications.twitter

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:api_key]
      config.consumer_secret = Rails.application.credentials.twitter[:api_secret]
      config.access_token = auth.access_token
      config.access_token_secret = auth.access_token_secret
    end
    @user = user
  end

  def home_timeline(count)
    tweets = @client.home_timeline(count: count)
    add_is_created(tweets)
  end

  private

    def add_is_created(tweets)
      created_tweet_ids = @user.tweets.pluck(:tweet_id)
      tweets.each do |tweet|
        tweet.instance_variable_set(:@is_created, created_tweet_ids.include?(tweet.attrs[:id]))
      end
    end
end
