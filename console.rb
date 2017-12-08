# console.rb
require('pry')
require_relative('./models/customer.rb')

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


#
#
# film1 = Film.new()
# film1.save()
#
# ticket1 = Ticket.new()
# ticket1.save()

binding.pry
nil









# console.rb
