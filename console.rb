require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({"name" => "Liam", "funds" => 20})
customer1.save()
customer2 = Customer.new({"name" => "Donald", "funds" => 2000})
customer2.save()
customer3 = Customer.new({"name" => "Frazzo", "funds" => 25})
customer3.save()

film1 = Film.new({"title" => "Transformers", "price" => 8})
film1.save()
film2 = Film.new({"title" => "Iron-man", "price" => 5})
film2.save()
film3 = Film.new({"title" => "Avengers", "price" => 10})
film3.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket1.save()
ticket2 = Ticket.new({"customer_id" => customer2.id, "film_id" => film1.id})
ticket2.save()
ticket3 = Ticket.new({"customer_id" => customer3.id, "film_id" => film2.id})
ticket3.save()
ticket4 = Ticket.new({"customer_id" => customer1.id, "film_id" => film3.id})
ticket4.save()
ticket5 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id})
ticket5.save()
ticket6 = Ticket.new({"customer_id" => customer3.id, "film_id" => film3.id})
ticket6.save()

screening1 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening1.save()
screening2 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening2.save()
screening3 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening3.save()
screening4 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening4.save()
screening5 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening5.save()
screening6 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening6.save()
screening7 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening7.save()
screening8 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening8.save()
screening9 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
screening9.save()

binding.pry
nil
