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






end
