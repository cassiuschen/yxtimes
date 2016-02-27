class FocusesController < ApplicationController
	def index
		@focuses = Focuse.all
	end

	def show
		@focuse = Focuse.find(params[:id])
	end
	
end
