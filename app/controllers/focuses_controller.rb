class FocusesController < ApplicationController
	def index
		@focuses = Focus.all
	end
	
end
