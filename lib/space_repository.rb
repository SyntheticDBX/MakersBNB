
require 'space'
require 'database_connection'

# frozen_string_literal: true

class SpaceRepository
    def all
        sql = "SELECT * FROM spaces"
        result_set = DatabaseConnection.exec_params(sql, [])
  
        spaces = []

        results = result_set.each do |record|
            space = Space.new

            space.id = record['id'].to_i
            space.name = record['name']
            space.description = record['description']
            space.user_id = record['user_id'].to_i
            space.first_line_address = record['first_line_address']
            space.second_line_address = record['second_line_address']
            space.city = record['city']
            space.country = record['country']
            space.postcode = record['postcode']
            space.space_created_date = record['space_created_date']
            space.price_per_night = record['price_per_night'].to_f
  
            spaces << space
        end

        return spaces
    end

    def find(id)
        sql = "SELECT * FROM spaces WHERE id = $1"
        result_set = DatabaseConnection.exec_params(sql, [id])

        result_set.each do |record|

            space = Space.new
            space.id = record['id'].to_i
            space.name = record['name']
            space.description = record['description']
            space.user_id = record['user_id'].to_i
            space.first_line_address = record['first_line_address']
            space.second_line_address = record['second_line_address']
            space.city = record['city']
            space.country = record['country']
            space.postcode = record['postcode']
            space.space_created_date = record['space_created_date']
            space.price_per_night = record['price_per_night'].to_f
            
            return space
        end

    end
    
    def create(space)
        current_id = DatabaseConnection.exec_params("SELECT setval('spaces_id_seq', (SELECT max(id) FROM spaces));", []).to_a.first["setval"].to_i
        next_id = current_id + 1
        sql_params = [next_id, space.name, space.description, space.user_id, space.first_line_address, space.second_line_address, space.city, space.country, space.postcode, space.space_created_date, space.price_per_night]
        sql_query = "INSERT INTO spaces (id, name, description, user_id, first_line_address, second_line_address, city, country, postcode, space_created_date, price_per_night) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);"
        result = DatabaseConnection.exec_params(sql_query, sql_params)
        
        return nil
    end
end