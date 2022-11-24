class ArticlesController < ApplicationController
  skip_before_action :require_login, only: %i[show index]

  def show
    @article = Article.find_by(params[:id])
  end

  def index
  end

  private
  
  def set_article
    @article = Article.find_by(params[:id])
  end
end
