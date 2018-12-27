class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def not_authenticated
      redirect_to root_path, alert: "ログインしてください"
    end
end
