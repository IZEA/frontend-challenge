class ImageUploadsController < ApplicationController

  def index
    @image_upload = ImageUpload.new
    @image_uploads = ImageUpload.all
  end

  def create
    image_upload = ImageUpload.new(multipart_file_data: image_upload_params[:file])
    uploaded = image_upload.upload

    if uploaded
      redirect_to root_path
    else
      
    end
  end

private 

  def image_upload_params
    params.require(:image_upload).permit(:file)
  end
end
