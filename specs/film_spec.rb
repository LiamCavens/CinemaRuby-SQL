require('minitest/autorun')
require('minitest/rg')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')

class FilmTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new({"name" => "Liam", "funds" => 20}) 
        @film1 = Film.new({"title" => "Transformers", "price" => 8})
        @screening1 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00"})
        @ticket1 = Ticket.new({"customer_id" => @customer1.id, "screening_id" => @screening1.id})
    end

    def test_film_has_name()
        assert_equal("Transformers", @film1.title)
    end

    def test_film_has_price()
        assert_equal(8, @film1.price)
    end

    def test_customers_watching_film()
        @film1.customer_enters_film_screen(@customer1)
        assert_equal(1, @film1.get_customers_in_screen())
    end


end