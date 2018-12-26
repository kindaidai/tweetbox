class OauthsController < ApplicationController

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, notice: 'ログインに成功しました'
    else
      begin
        # TODO: イケてないので直したい
        User.transaction do
          @user = create_from(provider)
          @user.authentications.twitter.update!(
            access_token: access_token.token,
            access_token_secret: access_token.secret
          )
        end
        reset_session
        auto_login(@user)
        redirect_to root_path, notice: 'ログインしました。'
      rescue
        redirect_to root_path, alert: 'ログインに失敗しました'
      end
    end
  end

  private

    def auth_params
      params.permit(:code, :provider)
    end
end
