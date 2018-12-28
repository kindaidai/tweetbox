class TopController < ApplicationController
  def index
    if logged_in?
      client = TwitterManager.new(current_user)
      # see https://developer.twitter.com/en/docs/tweets/timelines/guides/working-with-timelines
      max_id = params[:max_id].to_i - 1 if params[:max_id]
      @tweets = client.home_timeline(100, max_id)
    end
  rescue Twitter::Error::TooManyRequests => e
    logger.error e
    logger.error e.backtrace.join("\n")
    flash.now[:alert] = 'TwitterAPIコールが規定回数を超えました'
    render action: :index
  end
end
