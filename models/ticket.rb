# ticket.rb

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screening_id

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @customer_id = options['customer_id'].to_i
      @film_id = options['film_id'].to_i
      @screening_id = options['screening_id'].to_i
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


  def self.sell(customer, screening)

    # film screening attendance increases by 1
    # if and only if there is room in the cinema

    # customer pays for ticket
    if customer.can_afford?(screening.price())
      customer.pay(screening.price)
      ticket = Ticket.new({
        'customer_id' => customer.id,
        'film_id' => screening.film_id,
        'screening_id' => screening.id
        })
      ticket.save()
    end
    # ticket is created
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
    sql = "UPDATE tickets SET (customer_id, film_id, screening_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@customer_id, @ticket_id, @screening_id, @id]
    sql_result = SqlRunner.run(sql, values)
    return nil
  end

  def insert()
    sql = "INSERT INTO tickets (customer_id, film_id, screening_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@customer_id, @film_id, @screening_id]
    sql_result = SqlRunner.run(sql, values)
    @id = sql_result[0]['id']
    return @id
  end

end



# ticket.rb
