# console.rb
require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')

Customer.delete_all()

customer1 = Customer.new({
  'name' => 'Maya Angelou',
  'funds' => '5000'
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

found = Customer.find_one(customer3.id)




film1 = Film.new({
  'title' => 'The Third Man',
  'price' => 1000
  })
# film1.save()

film2 = Film.new({
  'title' => 'Metropolis',
  'price' => 800
  })
# film2.save()
film3 = Film.new({
  'title' => 'Steel Magnolias',
  'price' => 650
  })
# film3.save()
film4 = Film.new({
  'title' => 'Star Wars: Return of the Jedi',
  'price' => 1000
  })
# film4.save()
film5 = Film.new({
  'title' => 'Driving Miss Daisy',
  'price' => 500
  })
# film5.save()



#
# ticket1 = Ticket.new()
# ticket1.save()

binding.pry
nil









# console.rb
