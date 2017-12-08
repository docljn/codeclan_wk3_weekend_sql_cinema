# console.rb
require('pry')
require_relative('./models/customer.rb')

Customer.delete_all()

customer1 = Customer.new({
  'name' => 'Maya Angelou',
  'funds' => '100'
})

customer1.save()

customer1.name= 'Neil Gaiman'
customer1.save()
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
