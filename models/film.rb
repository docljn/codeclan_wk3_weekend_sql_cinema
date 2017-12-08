# film.rb
require_relative('../db/sql_runner.rb')

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'] if options['id']
    @title = options['title']
    @price = options['price']
  end

  # class methods
  def self.delete_all()
    sql = "DELETE FROM films;"
    sql_result = SqlRunner.run(sql)
  end

  def self.find_one(id)
    sql = "SELECT * FROM films WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    if sql_result.count == 0
      return nil
    end
    return Film.new(sql_result[0])
  end

  def self.return_all()
    sql = "SELECT * FROM films;"
    sql_result = SqlRunner.run(sql)
    return sql_result.map {|hash| Film.new(hash)}
  end

  # instance methods

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    sql_result = SqlRunner.run(sql, values)
    return nil
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
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
    return @id
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
    values = [@title, @price, @id]
    sql_result = SqlRunner.run(sql, values)
  end


end




# film.rb
