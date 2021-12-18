class ArticlesController < BaseController
  before_action :find_article, only: [:edit,:show,:update,:destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def from_author
    @user =  User.find(params[:user_id])
  end

  def new
    @article = Article.new
    #@article.title = "Mostrando algo"
    #@article.rayContent = "pa que salga algo"
  end

  def create

    @article = Article.create(title: params[:article][:title],
                              rayContent: params[:article][:rayContent], user: current_user)
    # render json: @article
    @article.save_categories
    redirect_to articles_path
  end
  def edit

  end

  def update
    #@article = Article.find(params[:id])
    @article.update(title: params[:article][:title], rayContent: params[:article][:rayContent],user: current_user)

    @article.save_categories
    redirect_to @article
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end
  def find_article
    @article = Article.find(params[:id])
  end

  def strong_params
    params.require(:article).permit(:title,:rayContent,:user_id)
  end
end
