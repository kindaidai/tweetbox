class TopController < ApplicationController
  def index
    if logged_in?
      client = TwitterManager.new(current_user).client
      @tweets = client.home_timeline(count: 10)
    end
  end
end
