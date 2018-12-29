class Twitter::FollowersController < ApplicationController
  before_action :require_login
  before_action :set_twitter_client

  def create
    @client.follow(params["screen_name"])
    redirect_to suggested_users_path
  end

  def destroy
    @client.unfollow(params["screen_name"])
    redirect_to suggested_users_path
  end

  private

    def set_twitter_client
      @client = TwitterManager.new(current_user).client
    end
end
