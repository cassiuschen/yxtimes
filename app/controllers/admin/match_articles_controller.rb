class Admin::MatchArticlesController < Admin::BaseController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all
	end

	def show
	end

	def new
    @match = Match.find(params[:match_id])
		@article = Article.new
	end

	def edit
	end

	def create
    @match = Match.find(params[:match_id])
		@article = @match.articles.create(article_params)

		respond_to do |format|
			if @article.save
				format.html { redirect_to [:admin, @match], notice: 'Article was successfully created.' }
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
        format.html { redirect_to [:admin, @match], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @match = Match.find(params[:match_id])
    @article = @match.articles.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_match_path(@match), notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @match = Match.find(params[:match_id])
      @article = @match.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :author, :des, :content, :tag, :picture, :banner, :kind)
    end


end