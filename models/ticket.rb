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

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    sql_result = SqlRunner.run(sql)
  end

  def self.find_one(id)
    sql = "SELECT * FROM tickets  WHERE id = $1;"
    values = [id]
    sql_result = SqlRunner.run(sql, values)
    return Ticket.new(sql_result[0])
  end

  def self.return_all()
    sql = "SELECT * FROM tickets;"
    sql_result = SqlRunner.run(sql)
    tickets = sql_result.map {|hash| Ticket.new(hash)}
    return tickets
  end

  def self.sell(customer, film)
    # customer pays for ticket
    customer.pay(film.price)

    # film screening attendance increases by 1


    # ticket is created
    ticket = Ticket.new({
      'customer_id' => customer.id,
      'film_id' => film.id
      })
    ticket.save()
    return ticket
  end

  # instance methods

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    sql_result = SqlRunner.run(sql, values)
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
