class TwitterManager
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
    screen_name = @user.screen_name
    @client.home_timeline(count: count)
  end
end
