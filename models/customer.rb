require_relative("../db/sql_runner.rb")
require_relative("ticket.rb")
require_relative("film.rb")
require_relative("screening.rb")

class Customer

    attr_reader :id
    attr_accessor :name, :funds

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @funds = options["funds"]
        @tickets = []
    end

    def save()
        sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
        values = [@name, @funds]
        customer = SqlRunner.run(sql, values).first
        @id = customer["id"].to_i
    end
    
    def update()
        sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;"
        values = [@name, @funds, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM customers WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM customers;"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM customers;"
        customers = SqlRunner.run(sql)
        return customers.map{|customer| self.new(customer)}
    end

    def films()
        sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1;"
        values = [@id]
        films = SqlRunner.run(sql, values)
        return Film.map_films(films)
    end

    def self.map_customers(customer_data)
        return customer_data.map{|customer_hash| Customer.new(customer_hash)}
    end

    def get_ticket(film)
        return @tickets.push(film)
    end

    def get_tickets_in_tickets_tab()
        return @tickets.length()
    end

    def customer_pays_for_tickets()
        for film in @tickets
            @funds -= film.price
        end
    end
end