# console.rb
require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
  'name' => 'Maya Angelou',
  'funds' => '500'
})

customer1.save()

customer2 = Customer.new({
  'name' => 'Robert Frost',
  'funds' => '8000'
})
customer2.save()

customer3 = Customer.new({
  'name' => 'Mary Oliver',
  'funds' => '15000'
})
customer3.save()

customer4 = Customer.new({
  'name' => 'Neil Gaiman',
  'funds' => '10000'
})
customer4.save()


customer1.name= 'Eleanor Hooker'
customer1.save()

customer4.delete

customers = Customer.return_all()

found_customer = Customer.find_one(customer3.id)




film1 = Film.new({
  'title' => 'The Third Man',
  'price' => 1000
  })
film1.save()

film2 = Film.new({
  'title' => 'Metropolis',
  'price' => 800
  })
film2.save()

film3 = Film.new({
  'title' => 'Steel Magnolias',
  'price' => 650
  })
film3.save()

film4 = Film.new({
  'title' => 'Star Wars: Return of the Jedi',
  'price' => 1000
  })
film4.save()

film5 = Film.new({
  'title' => 'Driving Miss Daisy',
  'price' => 500
  })
film5.save()

film4.price = 250
film4.save()

film3.delete()

found_film = Film.find_one(film2.id)


# original method for generating a new ticket
# ticket1 = Ticket.new({
#   'customer_id' => customer1.id,
#   'film_id' => film2.id
#   })
# ticket1.save()

ticket1 = Ticket.sell(customer1, film2)
ticket2 = Ticket.sell(customer2, film4)
ticket3 = Ticket.sell(customer1, film4)
ticket4 = Ticket.sell(customer3, film4)
ticket5 = Ticket.sell(customer2, film2)

ticket4.delete()

tickets = Ticket.return_all()
found_ticket = Ticket.find_one(ticket2.id)

attending_film4 = film4.customers()
tickets_sold_film4 = film4.tickets().count
customer1_films = customer1.films()

binding.pry
nil









# console.rb
