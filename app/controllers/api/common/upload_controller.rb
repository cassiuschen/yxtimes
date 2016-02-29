class Api::Common::UploadController < Api::BaseController

  def create
    @image = ArticleThumb.new
    @image.file = file_params
    if @image.save
      render json: { file_path: @image.file.url }
    end
  end

  private
  def file_params
    params[:upload_file]
  end
end