class Admin::FocuseArticlesController < Admin::BaseController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all
	end

	def show
	end

	def new
    @focuse = Focuse.find(params[:focuse_id])
		@article = Article.new
	end

	def edit
	end

	def create
    @focuse = Focuse.find(params[:focuse_id])
		@article = @focuse.articles.create(article_params)

		respond_to do |format|
			if @article.save
				format.html { redirect_to [:admin, @focuse], notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [:admin, @focuse], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @focuse = Focuse.find(params[:focuse_id])
    @article = @focuse.articles.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_focuse_path(@focuse), notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @focuse = Focuse.find(params[:focuse_id])
      @article = @focuse.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :author, :des, :content, :tag, :picture, :banner, :kind)
    end


end