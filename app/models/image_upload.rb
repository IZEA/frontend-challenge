class ImageUpload < ApplicationRecord
  has_one_attached :file

  before_destroy :remove_file

  private

  def remove_file
    file.purge
  end
end
