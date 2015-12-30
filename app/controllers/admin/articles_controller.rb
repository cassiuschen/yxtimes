class Admin::ArticlesController < Admin::BaseController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

  def avatar
    content = @article.avatar.read
    if stale?(etag: content, last_modified: @user.updated_at.utc, public: true)
      send_data content, type: @article.avatar.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

	def index
		@articles = Article.all
	end

	def show
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.new(article_params)

		respond_to do |format|
			if @article.save
				format.html { redirect_to [:admin, @article], notice: 'Article was successfully created.' }
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
        format.html { redirect_to [:admin, @article], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :author, :des, :content, :tag, :picture, :banner)
    end


end