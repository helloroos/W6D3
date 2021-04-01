# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.delete_all
  Artwork.delete_all
  ArtworkShare.delete_all

  ara = User.create(
    username: "Ara"
  )

  miche = User.create(
    username: "Miche"
  )

  sy = User.create(
    username: "Sy"
  )

  abc = Artwork.create(
      title: 'ABC',
      image_url: 'abc.com',
      artist_id: ara.id
  )

  defg = Artwork.create(
      title: 'DEFG',
      image_url: 'defg.com',
      artist_id: miche.id
  )

  share1 = ArtworkShare.create(viewer_id: ara.id, artwork_id: defg.id)
  share2= ArtworkShare.create(viewer_id: sy.id, artwork_id: abc.id)
  
end