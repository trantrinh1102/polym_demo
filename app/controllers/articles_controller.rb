class ArticlesController < ApplicationController
  before_action :load_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @commentable = @article
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new
    end
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was destroyed."
  end

  private

  def load_article
    @article = Article.find(params[:id])
  end

  def article_params
    binding.pry
    params.require(:article).permit!
  end
end

