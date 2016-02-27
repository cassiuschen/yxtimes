class WelcomeController < ApplicationController
  def index
  	@articles = Article.all.sort_by {|d| Time.now - d.updated_at}
  end

  def about
  end

end
