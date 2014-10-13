class ArticlesController < ApplicationController

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to "/articles"
	end

	def update
		@article = Article.find(params[:id])
		
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end


	def edit
		@article = Article.find(params[:id])
	end


	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
		#@article.save
		#redirect_to @article
		#render plain: params[:article].inspect
	end

	def show
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end

end
