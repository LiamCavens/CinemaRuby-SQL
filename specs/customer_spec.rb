require('minitest/autorun')
require('minitest/rg')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

class CustomerTest < MiniTest::Test
    
    def setup()
        @customer1 = Customer.new({"name" => "Liam", "funds" => 20}) 
        @film1 = Film.new({"title" => "Transformers", "price" => 8})
        @ticket1 = Ticket.new({"customer_id" => @customer1.id, "film_id" => @film1.id})  
    end

    def test_customer_has_name()
        assert_equal("Liam", @customer1.name)
    end

    def test_customer_has_funds()
        assert_equal(20, @customer1.funds)
    end

    def test_customer_gets_ticket
        @customer1.get_ticket(@ticket1)
        assert_equal(1, @customer1.get_tickets_in_tickets_tab())
    end

    def test_customer_pays_for_film()
        @customer1.get_ticket(@film1)
        result = @customer1.customer_pays_for_tickets()
        assert_equal(12, @customer1.funds)
    end
end