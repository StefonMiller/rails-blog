class ArticlesController < ApplicationController

	def show
		@id = params[:id]
		@article = Article.find(@id)
	end
	
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	# Edit by default sends form responses to #update action
	def edit
		@article = Article.find(params[:id])
	end

	def create
		# Require article object form params, and permit title and description from this variable
		@article = Article.new(params.require(:article).permit(:title, :description))
		if @article.save
			# Create flash object so we can display it in view. Need to embed it in
			# application.html.erb first
			
			flash[:notice] = "Article created successfully"
			# Extract ID from article object and navigate to article_path/ID
			# if we are able to create the article
			redirect_to article_path(@article)
		else
			# Update for Rails 7, redirect to new page but now we have an article object
			# with errors attributes to print out
			render 'new', status: :unprocessable_entity
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = "Article updated successfully"
			redirect_to article_path(@article)
		else
			render 'edit', status: :unprocessable_entity
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

end