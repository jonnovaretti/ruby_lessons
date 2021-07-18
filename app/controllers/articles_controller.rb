class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def show; end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(read_article_from_params)
    @article.user = current_user

    if @article.save
      flash[:notification] = 'Article was created successfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(read_article_from_params)
      flash[:notice] = 'Article was updated successfully'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def read_article_from_params
    params.require(:article).permit(:title, :description)
  end
end
