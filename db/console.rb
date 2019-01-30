require('pry')
require_relative("../models/album")
require_relative("../models/artist")

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({
  'name' => 'Infected Mushroom'
  })

artist_2 = Artist.new({
  'name' => 'Baby Metal'
  })

artist_1.save
artist_2.save

album_1 = Album.new ({
  'name' => 'Converting Vegetarians',
  'genre' => 'Psytrance',
  'artist_id' => artist_1.id
  })

album_2 = Album.new ({
  'name' => 'Give me Chocolate',
  'genre' => 'Metal',
  'artist_id' => artist_2.id
})

album_3 = Album.new ({
  'name' => 'Brainless',
  'genre' => 'Metal',
  'artist_id' => artist_2.id
})


album_1.save
album_2.save
album_3.save
album_3.name = 'Save Me'
album_3.edit
artist_1.name = 'Anthem'
artist_1.edit
artist_id = Artist.find(artist_1.id)
album_id = Album.find(album_2.id)

binding.pry
nil
