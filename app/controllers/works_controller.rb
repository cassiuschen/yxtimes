class WorksController < ApplicationController
  #before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  # GET /works.json
  def index
    @works = Article.where(kind: 'work')
  end

end

