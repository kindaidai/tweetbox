class TopController < ApplicationController
  def index
    if logged_in?
      twitter_client = TwitterManager.new(current_user)
      @tweets = twitter_client.home_timeline(10)
    end
  end
end
