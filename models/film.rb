require_relative("../db/sql_runner.rb")
require_relative("ticket.rb")
require_relative("customer.rb")

class Film

    attr_reader :id
    attr_accessor :title, :price

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @title = options["title"]
        @price = options["price"]
        @customers_in_screen = []
    end

    def save()
        sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
        values = [@title, @price]
        film = SqlRunner.run(sql, values).first
        @id = film["id"].to_i
    end

    def update()
        sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
        values = [@title, @price, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM films WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM films;"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM films;"
        films = SqlRunner.run(sql)
        return films.map{|film| self.new(film)}
    end

    def customers()
        sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1;"
        values = [@id]
        customers = SqlRunner.run(sql, values)
        return Customer.map_customers(customers)
    end

    def self.map_films(film_data)
        return film_data.map{|film_hash| Film.new(film_hash)}
    end

    def customer_enters_film_screen(customer)
        return @customers_in_screen.push(customer)
    end

    def get_customers_in_screen()
        return @customers_in_screen.length()
    end

end