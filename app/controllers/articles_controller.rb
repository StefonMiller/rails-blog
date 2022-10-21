class ArticlesController < ApplicationController
	# Execute private method set_article before executing any of the following
	# public methods defined in only: []
	before_action :set_article, only:[:show, :edit, :update, :destroy]


	def show
	end
	
	def home
	end

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def new
		@article = Article.new
	end

	# Edit by default sends form responses to #update action
	def edit
	end

	def create
		# Require article object form params, and permit title and description from this variable
		@article = Article.new(whitelist)
		@article.user = User.first
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
		if @article.update(whitelist)
			flash[:notice] = "Article updated successfully"
			redirect_to article_path(@article)
		else
			render 'edit', status: :unprocessable_entity
		end
	end

	def destroy
		@article.destroy
		flash[:notice] = "Article deleted"
		redirect_to articles_path
	end

	# Methods defined below private are only available within their respective
	# controller
	private
	
	def set_article
		@article = Article.find(params[:id])
	end

	def whitelist
		params.require(:article).permit(:title, :description)
	end

end