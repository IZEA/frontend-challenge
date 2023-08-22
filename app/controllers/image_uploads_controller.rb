class ImageUploadsController < ApplicationController
  def index
    @image_upload = ImageUpload.new
    @image_uploads = ImageUpload.all
    puts @image_uploads.inspect # Debug line
  end

  def create
    existing_files_count = ImageUpload.count
    max_files = 10

    if existing_files_count >= max_files
      redirect_to root_path, alert: 'You can only upload a maximum of 10 files.'
      return
    end

    @image_upload = ImageUpload.new
    @image_upload.file.attach(image_upload_params[:file])

    if @image_upload.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('image-container', partial: 'image_uploads/image',
                                                                      locals: { image_upload: @image_upload })
        end
        format.html { redirect_to root_path, notice: 'File successfully uploaded.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          # Handle turbo_stream error, if necessary
        end
        format.html { redirect_to root_path, alert: 'File could not be uploaded.' }
      end
    end
  end

  def destroy
    @image_upload = ImageUpload.find(params[:id])
    if @image_upload.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path, notice: 'File successfully deleted.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          # Handle turbo_stream error, if necessary
        end
        format.html { redirect_to root_path, alert: 'File could not be deleted.' }
      end
    end
  end

  private

  def image_upload_params
    params.require(:image_upload).permit(:file)
  end
end
