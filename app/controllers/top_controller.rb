class TopController < ApplicationController
  def index
    if logged_in?
      client = TwitterManager.new(current_user)
      @tweets = client.home_timeline(100)
    end
  end
end
