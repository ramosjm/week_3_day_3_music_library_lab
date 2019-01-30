require('pg')
require_relative('../db/sql_runner.rb')
require_relative('album.rb')


class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO artist (name)
    VALUES ($1)
    RETURNING * "
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.list()
    sql = "SELECT * FROM artist"
    all_artists = SqlRunner.run(sql)
    return all_artists.map { |artist| Artist.new(artist) }
  end
  def artist_by_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    all_albums = SqlRunner.run(sql,values)
    return all_albums.map {|album| Album.new(album)}
  end

  def edit()
    sql = "UPDATE artist SET name = $1 WHERE id = $2"
    values = [@name,@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM artist"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    returned_id = Artist.new(results[0])
    return returned_id
  end


end
