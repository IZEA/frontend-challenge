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
      redirect_to root_path, notice: 'Image was not uploaded.'
    end
  end

  def destroy
    @image_upload = ImageUpload.find(params[:id])
    destroyed = @image_upload.destroy

    if destroyed
         flash[:notice] = 'Image was deleted.'
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
    end
    else
      redirect_to root_path, notice: 'Image was not deleted.'
    end
  end

private

  def image_upload_params
    params.require(:image_upload).permit(:file)
  end
end
