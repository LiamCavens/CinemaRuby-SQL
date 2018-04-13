require('minitest/autorun')
require('minitest/rg')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

class CustomerTest < MiniTest::Test
    
    def setup()
        @customer1 = Customer.new({"name" => "Liam", "funds" => 20})   
    end

    def test_customer_has_name()
        assert_equal("Liam", @customer1.name)
    end

    def test_customer_has_funds()
        assert_equal(20, @customer1.funds)
    end
end