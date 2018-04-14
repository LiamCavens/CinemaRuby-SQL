require('minitest/autorun')
require('minitest/rg')
require_relative('../models/film.rb')
require_relative('../models/customer.rb')
require_relative('../models/ticket.rb')
require_relative('../models/screening.rb')

class ScreeningTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new({"name" => "Liam", "funds" => 20}) 
        @customer2 = Customer.new({"name" => "Heather", "funds" => 20}) 
        @customer3 = Customer.new({"name" => "Ross", "funds" => 20}) 
        @customer4 = Customer.new({"name" => "Jamie", "funds" => 20}) 
        @customer5 = Customer.new({"name" => "Dave", "funds" => 20}) 
        @customer6 = Customer.new({"name" => "Donald", "funds" => 20000000}) 
        @film1 = Film.new({"title" => "Transformers", "price" => 8})
        @screening1 = Screening.new({"film_id" => @film1.id, "screen_time" => "16:00", "screen_limit" => 5})
        @ticket1 = Ticket.new({"customer_id" => @customer1.id, "screening_id" => @screening1.id})
    end

    def test_screening_has_time()
        assert_equal("16:00", @screening1.screen_time)
    end

    def test_sold_out_on_screen_limit()
        @film1.customer_enters_film_screen(@customer1)
        @film1.customer_enters_film_screen(@customer2)
        @film1.customer_enters_film_screen(@customer3)
        @film1.customer_enters_film_screen(@customer4)
        @film1.customer_enters_film_screen(@customer5)
        @film1.customer_enters_film_screen(@customer6)
        assert_equal("Film Sold Out", @screening1.limit_customers_in_screen(@film1))
    end
end