class ImageUpload < ApplicationRecord

  SRC_DIR = 'images/uploads'

  validates :file_path, presence: true, uniqueness: true

  before_destroy :remove_file

  attr_accessor :multipart_file_data

  def upload
    self.file_path = "#{SRC_DIR}/#{multipart_file_data.original_filename}"
    file = File.new(Rails.root.join('public', file_path), 'w')
  
    file.write(multipart_file_data.read.force_encoding("UTF-8"))

    save!
  end

private

  def remove_file
    FileUtils.rm Rails.root.join('public', file_path)
  end
end
