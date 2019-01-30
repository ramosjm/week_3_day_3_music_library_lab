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
