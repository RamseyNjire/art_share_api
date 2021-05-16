# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ramsey = User.create(username: "Ramsey")
reson = User.create(username: "Reson")
gideon = User.create(username: "Gideon")
wamucii = User.create(username: "Wamucii")
brian = User.create(username: "Brian")
meteur = User.create(username: "Meteur")
sophie = User.create(username: "Sophie")
mwangi = User.create(username: "Mwangi")

phallus = Artwork.create(title: "phallus", image_url: "first_url", artist_id: brian.id)
devil_horn = Artwork.create(title: "devil_horn", image_url: "second_url", artist_id: gideon.id)
hotdog = Artwork.create(title: "wamucii", image_url: "third_url", artist_id: wamucii.id)
mushroom = Artwork.create(title: "mushroom", image_url: "fourth_url", artist_id: wamucii.id)
ladybird = Artwork.create(title: "ladybird", image_url: "fifth_url", artist_id: reson.id)

ArtworkShare.create(artwork_id: phallus.id, viewer_id: ramsey.id)
ArtworkShare.create(artwork_id: mushroom.id, viewer_id: ramsey.id)
ArtworkShare.create(artwork_id: hotdog.id, viewer_id: meteur.id)
ArtworkShare.create(artwork_id: mushroom.id, viewer_id: mwangi.id)
ArtworkShare.create(artwork_id: ladybird.id, viewer_id: sophie.id)

Comment.create(artwork_id: phallus.id, commenter_id: ramsey.id, body: "This is basically a penis")
Comment.create(artwork_id: hotdog.id, commenter_id: meteur.id, body: "This is a hotdog")
Comment.create(artwork_id: mushroom.id, commenter_id: ramsey.id, body: "This is a trippy mushroom")
Comment.create(artwork_id: mushroom.id, commenter_id: mwangi.id, body: "Yeah, I'm getting high just looking at it")




