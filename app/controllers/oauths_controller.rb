class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:denied].present?
      redirect_to root_path, success: ("#{provider}アカウントでのアカウント作成に成功しました")
      return
    end

    begin
      create_user_from(provider) unless (@user = login_from(provider))
      redirect_to root_path, success: ("#{provider}アカウントでログインしました")

    rescue StandardError
      redirect_to root_path, danger: ("#{provider}アカウントでログインに失敗しました")
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied, :oauth_token, :oauth_verifier)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
