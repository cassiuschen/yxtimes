class Admin::ForecastsController < Admin::BaseController
	

	def index
    @forecasts = Forecast.all
  end

  def show

  end

  def new
    @forecast = Forecast.new
  end

  def edit
  end

	def create

		@match = Match.find(params[:match_id])
		@forecast = @match.forecasts.create(forecast_params)
		redirect_to admin_match_path(@match)
	end

	def update
    @match = Match.find(params[:match_id])
    @forecast = @match.forecasts.update(forecast_params)
    respond_to do |format|
      if @forecast.update(forecast_params)
        format.html { redirect_to [:admin, @match], notice: 'Forecast was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@match = Match.find(params[:match_id])
		@forecast = @match.forecasts.find(params[:id])
		@forecast.destroy
		redirect_to admin_match_path(@match)
	end

	private
		def forecast_params
			params.require(:forecast).permit(:content)
		end

end