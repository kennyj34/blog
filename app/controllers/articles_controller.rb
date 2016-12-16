class ArticlesController < ApplicationController
  before_action :set_param, only: [:edit,:show,:update,:destroy]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article Was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    
  end
  
  def destroy
    if  @article.destroy
      flash[:notice] = "Article was successfully Destroyed"
      redirect_to articles_path
    else
      render 'destroy'
    end
  end
  
  private
    def set_param
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title,:description)
    end
  
end
