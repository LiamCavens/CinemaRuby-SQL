require_relative("../db/sql_runner.rb")
require_relative("film.rb")
require_relative("ticket.rb")
require_relative("customer.rb")

class Screening

    attr_reader :id
    attr_accessor :film_id, :screen_time, :screen_limit

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @film_id = options["film_id"].to_i
        @screen_time = options["screen_time"]
        @screen_limit = options["screen_limit"]
    end


    def save()
        sql = "INSERT INTO screenings (film_id, screen_time, screen_limit) VALUES ($1, $2, $3) RETURNING id;"
        values = [@film_id, @screen_time, @screen_limit]
        screening = SqlRunner.run(sql, values).first
        @id = screening["id"].to_i
    end

    def update()
        sql = "UPDATE screenings SET (film_id, screen_time, screen_limit) = ($1, $2, $3) WHERE id = $4;"
        values = [@film_id, @screen_id, @screen_limit, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM screenings WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM screenings;"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM screenings;"
        screenings = SqlRunner.run(sql)
        return screenings.map{|screening| self.new(screening)}
    end

    def self.map_screenings(screening_data)
        return screening_data.map{|screening_hash| screening.new(screening_hash)}
    end

    def self.list_screen_times()
        sql = "SELECT screenings.screen_time FROM screenings ORDER BY screenings.screen_time;"
    end

    def self.find_most_popular_screening_time()
        sql = "SELECT screenings.screen_time FROM screenings;"
        screening_times = SqlRunner.run(sql)
        return screening_times.max_by {|times| screening_times.count(times)}
    end

    def limit_customers_in_screen(film)
        return "Film Sold Out" if film.get_customers_in_screen() > @screen_limit 
         if film.get_customers_in_screen() > @screen_limit + 1
            @customers_in_screen.drop(1)
         end
    end

    def limit_customers_in_screen(film)#This might or might not work
         return "Film Sold Out" if film.get_customers_in_screen() > @screen_limit && film.get_customers_in_screen() >= @screen_limit + 1
             @customers_in_screen.delete_at(-1)
     end
end