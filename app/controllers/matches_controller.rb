class MatchesController < ApplicationController
  def index
  	@basketballs = Match.where(kind: 'basketball')
  	@dramas = Match.where(kind: 'drama')
  	@footballs = Match.where(kind: 'football')
  	@dances = Match.where(kind: 'dance')
  end
end
