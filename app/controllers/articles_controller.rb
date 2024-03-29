class ArticlesController < ApplicationController
  skip_before_action :require_login, only: %i[show index]
  before_action :set_article

  def show
    @posts = @article.posts
    @post = Post.new
  end

  def index; end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
