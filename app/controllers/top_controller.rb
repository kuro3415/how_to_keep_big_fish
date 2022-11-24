class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @articles = Article.all.order(created_at: :asc)
  end
end
