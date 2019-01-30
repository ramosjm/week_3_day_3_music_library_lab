require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist')

class Album

  attr_reader :id
  attr_accessor :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = 'INSERT INTO albums (name,
    genre,
    artist_id
    ) VALUES
    ($1, $2, $3)
    RETURNING id'
    values = [@name, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.list()
    sql = "SELECT * FROM albums"
    all_albums = SqlRunner.run(sql)
    return all_albums.map {|album| Album.new(album)}
  end

  def album_by_artist
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql,values)
    all_artists = results[0]
    return Artist.new(all_artists)
  end

  def edit()
    sql = "UPDATE albums SET(name, genre)=($1,$2) WHERE id =$3"
    values = [@name,@genre,@artist_id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    returned_id = Album.new(results[0])
    return returned_id
  end


end
