require('pry')
require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new({
  'name' => 'Infected Mushroom'
  })

artist2 = Artist.new({
  'name' => 'Baby Metal'
  })



album1 = Album.new ({
  'name' => 'Converting Vegetarians',
  'genre' => 'Psytrance',
  'artist_id' => artist1.id
  })

album2 = Album.new ({
  'name' => 'Give me Chocolate',
  'genre' => 'Metal',
  'artist_id' => artist2.id
})

  binding.pry
  nil
