class CreateImageUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :image_uploads do |t|
      t.string :file_path
      t.timestamps
    end
  end
end
