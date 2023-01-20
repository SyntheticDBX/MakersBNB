
require_relative  './space'
require_relative  './database_connection'

# frozen_string_literal: true

class SpaceRepository
    def all
        sql = "SELECT * FROM spaces"
        result_set = DatabaseConnection.exec_params(sql, [])
        result_set.map { | space_hash | Space.new(space_hash)}
    end

    def find(id)
        sql = "SELECT * FROM spaces WHERE id = $1"
        result_set = DatabaseConnection.exec_params(sql, [id])
        result_set.map { | space_hash | Space.new(space_hash)}.first

    end

    def create(space_hash)
        sql_params = space_hash.to_a.map{|element| element.last}
        sql_query_columns ="(#{space_hash.to_a.map{|element| element.first}.join(", ")})"
        sql_values = "(#{space_hash.to_a.map.with_index{|element,index| "$#{index+1}"}.join(", ")})"
        sql_query = "INSERT INTO spaces #{sql_query_columns} VALUES#{sql_values};"
        DatabaseConnection.exec_params(sql_query, sql_params).to_a.first
    end
end