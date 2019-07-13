require_relative("./models/customer")
require_relative("./models/film")
require_relative("./models/ticket")


require( 'pry-byebug')

Customer.delete_all()
Film.delete_all()
# Ticket.delet_all()



customer1 = Customer.new({ 'name' => 'Richard', 'funds' => 10})
customer2 = Customer.new({ 'name' => 'Sara', 'funds' => 20})
customer3 = Customer.new({ 'name' => 'Anna', 'funds' => 30})
customer4 = Customer.new({ 'name' => 'John', 'funds' => 5})

customer1.save
customer2.save
customer3.save
customer4.save

film1 = Film.new({ 'title' => "Terminator", 'price' => 5 })
film1.save
film2 = Film.new({ 'title' => "Babe", 'price' => 5 })
film2.save
film3 = Film.new({ 'title' => "The Piano", 'price' => 5 })
film3.save
film4 = Film.new({ 'title' => "Jurassic Park", 'price' => 5 })
film4.save



ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save


ticket2 = Ticket.new ({'customer_id' => customer2.id, 'film_id' => film2.id,})
ticket2.save

ticket3 = Ticket.new ({'customer_id' => customer2.id, 'film_id' => film1.id,})
ticket3.save

ticket3 = Ticket.new ({'customer_id' => customer2.id, 'film_id' => film1.id,})
ticket3.save


binding.pry
nil
