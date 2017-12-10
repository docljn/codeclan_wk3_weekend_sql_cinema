# screening.rb
require('pry')

class Screening

  attr_reader :id
  attr_accessor :screening_time, :film_id, :capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @screening_time = options['screening_time']
    @film_id = options['film_id'].to_i
    @capacity = options['capacity'].to_i
  end

  # class methods

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    sql_result = SqlRunner.run(sql)
  end


  def self.return_all()
    sql = "SELECT * FROM screenings;"
    sql_result = SqlRunner.run(sql)
    return sql_result.map {|hash| Screening.new(hash)}
  end

  def self.find_one(id)
    sql = "SELECT * FROM screenings WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    return Screening.new(sql_result[0])
  end



  # instance methods

  def delete_one()
    sql = "DELETE FROM screenings WHERE id = $1;"
    values = [@id]
    sql_result = SqlRunner.run(sql, values)
  end

  def price()
    sql = "SELECT price FROM films WHERE id = $1;"
    values = [@film_id]
    sql_result = SqlRunner.run(sql, values)
    return sql_result[0]['price'].to_i
  end


  def save()
    if @id
      update()
    else
      insert()
    end
  end


  # private methods
  private

  def insert()
    sql = "INSERT INTO screenings (screening_time, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@screening_time, @film_id]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
    return @id
  end

  def update()
    sql = "UPDATE screenings SET (time, film_id) = ($1, $2) WHERE id = $3;"
    values = [@screening_time, @film_id, @id]
    sql_result = SqlRunner.run(sql, values)
  end


end
# screening.rb
