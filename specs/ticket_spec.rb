require('minitest/autorun')
require('minitest/rg')
require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/screening.rb')

class TicketTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new({"name" => "Liam", "funds" => 20}) 
        @film1 = Film.new({"title" => "Transformers", "price" => 8})
        @screening1 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00", "screen_limit" => 5})
        @ticket1 = Ticket.new({"customer_id" => @customer1.id, "screening_id" => @screening1.id})
    end
end