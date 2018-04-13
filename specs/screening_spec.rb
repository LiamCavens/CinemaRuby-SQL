require('minitest/autorun')
require('minitest/rg')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')
require_relative('../models/screening.rb')

class ScreeningTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new({"name" => "Liam", "funds" => 20}) 
        @film1 = Film.new({"title" => "Transformers", "price" => 8})
        @ticket1 = Ticket.new({"customer_id" => @customer1.id, "film_id" => @film1.id})
        @screening1 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
    end

    def test_screening_has_time()
        assert_equal("16:00", @screening1.screen_time)
    end
end