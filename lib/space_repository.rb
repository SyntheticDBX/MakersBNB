require 'space'
# frozen_string_literal: true

class SpaceRepository
    def all
        sql = "SELECT * FROM spaces"
        result_set = DatabaseConnection.exec_params(sql, [])
  
        spaces = []

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
            space.price = record['price']
  
            spaces << space
        end
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
            space.price = record['price']

            return space
        end
    end
end