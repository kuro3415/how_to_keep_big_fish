class ApplicationController < ActionController::Base
  before_action :require_login

  add_flash_types :success, :info, :warning, :danger

  def set_twitter_api
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  private

  def not_authenticated
    redirect_to main_app.login_path
  end
end
