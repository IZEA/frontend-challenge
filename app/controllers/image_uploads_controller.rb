class ImageUploadsController < ApplicationController

  def index
    @image_upload = ImageUpload.new
    @image_uploads = ImageUpload.all

    respond_to do |format|
      format.html
      format.turbo_stream {
        render turbo_stream: turbo_stream.append(@image_upload)
      }
    end
  end


  def create
    image_upload = ImageUpload.new(image_upload_params)
    puts turbo_stream.append(image_upload)
    if image_upload.save
        respond_to do |format|
            format.html { redirect_to root_path }
            format.turbo_stream do
                turbo_stream.append(image_upload)
            end
        end
    else
      redirect_to root_path, notice: 'Image was not uploaded.'
    end
  end

  def destroy
    @image_upload = ImageUpload.find(params[:id])
    destroyed = @image_upload.destroy

  if destroyed
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream do
        turbo_stream.remove(@image_upload)
      end
    end

    else
      redirect_to root_path, notice: 'Image was not deleted.'
    end
  end

end

private

def image_upload_params
  params.require(:image_upload).permit(:file)
end
