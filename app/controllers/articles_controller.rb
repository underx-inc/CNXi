class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.save!
    redirect_to articles_url, notice: "記事「#{article.name}」を登録しました。"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_url, notice: "記事「#{article.name}」を削除しました。"
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_url, notice: "記事「#{@article.name}」を更新しました。"
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:name, :description)
  end
end
