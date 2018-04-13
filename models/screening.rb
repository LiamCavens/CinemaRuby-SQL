require_relative("../db/sql_runner.rb")
require_relative("film.rb")
require_relative("ticket.rb")

class Screening

    attr_reader :id
    attr_accessor :film_id, :screen_time

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @film_id = options["film_id"].to_i
        @screen_time = options["screen_time"]
    end


    def save()
        sql = "INSERT INTO screenings (film_id, screen_time) VALUES ($1, $2) RETURNING id;"
        values = [@film_id, @screen_time]
        screening = SqlRunner.run(sql, values).first
        @id = screening["id"].to_i
    end

    def update()
        sql = "UPDATE screenings SET (film_id, screen_time) = ($1, $2) WHERE id = $3;"
        values = [@film_id, @screen_id, @id]
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
        sql = "SELECT screenings.screen_time FROM screenings ORDER BY screenings.screen_time"
    end
end