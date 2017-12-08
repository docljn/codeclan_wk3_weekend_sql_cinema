# customer.rb
require('pry')
require_relative('../db/sql_runner.rb')


class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id     = options['id'].to_i if options['id']
    @name   = options['name']
    @funds  = options['funds']
  end

  def save()
    # removes need to know if you are inserting/updating
    if @id
      update()
    else
      insert()
    end
  end



  # should probably make these private as they are only used in .save()
  private

  def insert()
    # to add a new customer to the database, returning the new id
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    sql_return = SqlRunner.run(sql, values)
    @id = sql_return[0]['id']
  end

  def update()
    # to make changes to the existing customer, so no return value needs to be specified?
    sql ="UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;"
    values = [@name, @funds, @id]
    sql_return = SqlRunner.run(sql, values)
  end




end











# customer.rb
