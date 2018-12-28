class Twitter::TweetsController < ApplicationController
  before_action :require_login

  def create
    tweet = ::Tweet.new(user: current_user, tweet_id: params[:tweet_id])
    if tweet.save
      redirect_to root_path, notice: '保存しました'
    else
      redirect_to root_path, alert: '保存に失敗しました'
    end
  end
end
