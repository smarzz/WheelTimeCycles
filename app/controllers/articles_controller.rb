class ArticlesController < ApplicationController
   before_action :set_article, only: [:edit, :update, :show, :destroy]
   
   
   def index
       @articles = Article.paginate(page: params[:page], per_page: 8)
   end
   
   def new
       @article = Article.new
   end
   
   def edit
       
   end
   
   def update
       
        if @article.update(article_params)
           flash[:success] = "was updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
   end
 
   
   def create
       
       #render plain: params[:article].inspect
       @article = Article.new(article_params)
       @article.user = User.first
       
       if @article.save
           flash[:succsess] = "Article was succsessfully saved"
           redirect_to article_path(@article)
       else
            render 'new'
       end
       
   end
   
   def show
     
   end
   
   def destroy
       
       @article.destroy
       flash[:danger] = "Article was deleted"
       redirect_to articles_path
   end
   
   
   
   private 
   def set_article
       @article = Article.find(params[:id])
   end
   
   def article_params
       params.require(:article).permit(:title, :post)
   end
   
    
end