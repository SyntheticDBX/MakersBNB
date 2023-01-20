
require_relative  './space'
require_relative  './database_connection'

# frozen_string_literal: true

class SpaceRepository
    def all
        sql = "SELECT * FROM spaces"
        result_set = DatabaseConnection.exec_params(sql, [])
        result_set.map { | space_hash | Booking.new(space_hash)}
    end

    def find(id)
        sql = "SELECT * FROM spaces WHERE id = $1"
        result_set = DatabaseConnection.exec_params(sql, [id])
        result_set.map { | space_hash | Booking.new(space_hash)}.first

    end

    def create(space)

        sql_params = [space.name, space.description, space.user_id, space.first_line_address, space.second_line_address, space.city, space.country, space.postcode, space.space_created_date,space.dates_available, space.price_per_night]
        sql_query = "INSERT INTO spaces (name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date,dates_available, price_per_night) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);"
        DatabaseConnection.exec_params(sql_query, sql_params)
        
        return nil
    end
end