class Admin::FocusesController < Admin::BaseController
	before_action :set_focuse, only: [:show, :edit, :update, :destroy]

	def index
		@focusees = Focuse.all
	end

	def show
	end

	def new
		@focuse = Focuse.new
	end

	def edit
	end

	def create
		@focuse = Focuse.new(focuse_params)

		respond_to do |format|
			if @focuse.save
				format.html { redirect_to [:admin, @focuse], notice: 'Focuse was successfully created.' }
        format.json { render :show, status: :created, location: @focuse }
      else
        format.html { render :new }
        format.json { render json: @focuse.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
    respond_to do |format|
      if @focuse.update(focuse_params)
        format.html { redirect_to [:admin, @focuse], notice: 'Focuse was successfully updated.' }
        format.json { render :show, status: :ok, location: @focuse }
      else
        format.html { render :edit }
        format.json { render json: @focuse.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @focuse.destroy
    respond_to do |format|
      format.html { redirect_to admin_focuses_url, notice: 'Focuse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_focuse
      @focuse = Focuse.find(params[:id])
    end

    def focuse_params
      params.require(:focuse).permit(:title, :des, :content, :content, :picture, :banner, :created_at)
    end


end