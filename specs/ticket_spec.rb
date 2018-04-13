require('minitest/autorun')
require('minitest/rg')
require_relative('../models/customer.rb')
require_relative('../models/film.rb')

class TicketTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new({"name" => "Liam", "funds" => 20}) 
        @film1 = Film.new({"title" => "Transformers", "price" => 8})
        @ticket1 = Ticket.new({"customer_id" => @customer1.id, "film_id" => @film1.id})
    end
end