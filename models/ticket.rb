# ticket.rb

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @customer_id = options['customer_id'].to_i
      @film_id = options['film_id'].to_i
  end

  # class methods

  # instance methods

  def save()
    if @id
      update()
    else
      insert()
    end
  end

  # private methods
  private

  def update()
    sql = "UPDATE tickets SET (title, price) = ($1, $2) WHERE id = $3;"
    values = [@customer_id, @ticket_id, @id]
    sql_result = SqlRunner.run(sql, values)
    return nil
  end

  def insert()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@customer_id, @film_id]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
    return @id
  end

end



# ticket.rb
