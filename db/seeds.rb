# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

starter_photos = ['5.jpg', '7.jpg', '3.jpg', '1.jpg', '4.jpg', '8.jpg']

starter_photos.each do |photo|
  image_upload = ImageUpload.new
  image_upload.file.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'fixtures', photo)),
    filename: photo,
    content_type: 'image/jpeg'
  )
  image_upload.save!
end
