class Admin::ReportsController < Admin::BaseController
	

	def index
    @reports = Report.all
  end

  def show

  end

  def new
    @report = Report.new
  end

  def edit
  end

	def create
		@match = Match.find(params[:match_id])
		@report = @match.reports.create(report_params)
		redirect_to admin_match_path(@match)
	end

	def update
    @match = Match.find(params[:match_id])
    @report = @match.reports.update(report_params)
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to [:admin, @match], notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@match = Match.find(params[:match_id])
		@report = @match.reports.find(params[:id])
		@report.destroy
		redirect_to admin_match_path(@match)
	end

	private
		def report_params
			params.require(:report).permit(:content)
		end

end