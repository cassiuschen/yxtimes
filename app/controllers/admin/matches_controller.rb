class Admin::MatchesController < Admin::BaseController
	before_action :set_match, only: [:show, :edit, :update, :destroy]

	def index
		@matches = Match.all
	end

	def show
	end

	def new
		@match = Match.new
	end

	def edit
	end

	def create
		@match = Match.new(match_params)

		respond_to do |format|
			if @match.save
				format.html { redirect_to [:admin, @match], notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to [:admin, @match], notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to admin_matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    def match_params
      params.require(:match).permit(:kind, :name, :agenda, :state)
    end


end