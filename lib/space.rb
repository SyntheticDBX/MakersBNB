class Space
  attr_accessor :id, :name, :user_id, :first_line_address, :second_line_address, :city, :country, :postcode, :description, :space_created_date, :dates_available, :price_per_night

  def initialize(space_hash)
@id = space_hash['id'].to_i
@name = space_hash['name']
@description = space_hash['description']
@user_id = space_hash['user_id'].to_i
@first_line_address = space_hash['first_line_address']
@second_line_address = space_hash['second_line_address']
@city = space_hash['city']
@country = space_hash['country']
@postcode = space_hash['postcode']
@space_created_date = space_hash['space_created_date']
@dates_available = space_hash['dates_available']
@price_per_night = space_hash['price_per_night'].to_f
  end
end