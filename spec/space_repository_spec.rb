require_relative '../lib/space_repository'
require_relative '../lib/space'
require_relative '../lib/database_connection'

def reset_spaces_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
  connection.exec(seed_sql)
end

RSpec.describe SpaceRepository do

  before(:each) do
    reset_spaces_table
  end

  after(:each) do
    reset_spaces_table
  end

  context "all method" do
    repo = SpaceRepository.new
    spaces = repo.all

    it "returns all space records" do
      expect(spaces[1].name).to eq "Treehouse"
      expect(spaces[2].city).to eq "Sindangan"
      expect(spaces[3].price_per_night).to eq 55.0
      expect(spaces[4].user_id).to eq 5
    end
    it "should return length of 5" do
      expect(spaces.length).to eq 5
    end

  end

  context "find(id) method returns space by id" do
    repo = SpaceRepository.new
    space_id_3 = repo.find(3)
    space_id_5 = repo.find(5)
    it "returns space with id 5, name value" do
      expect(space_id_5.name).to eq "1-bedroom flat"
    end

    it "returns space with id 5, postcode value" do
      expect(space_id_5.postcode).to eq "74291"
    end
    it "returns space with id 5, space_created_date value" do
      expect(space_id_5.space_created_date).to eq "2022-09-20"
    end
    it "returns space with id 3, name" do
      expect(space_id_3.name).to eq "2-bedroom flat"
    end
    it "returns space with id 3, postcode" do
      expect(space_id_3.postcode).to eq "6305"
    end
    it "returns space with id 3, space_created_date" do
      expect(space_id_3.space_created_date).to eq "2022-05-14"
    end
  end

  it "creates new space" do
    space = Space.new
    space.name = 'Hemigraphis reptans'
    space.description = 'Anyway you want it'
    space.user_id = 3
    space.first_line_address = 'Mifflin'
    space.second_line_address = '2nd Floor'
    space.city = 'Overyata'
    space.country = 'Russia'
    space.postcode = '617071'
    space.space_created_date = '2020-07-17'
    space.price_per_night = 159
    repo = SpaceRepository.new
    repo.create(space)
    new_space = repo.find(6)

    expect(new_space.user_id).to eq space.user_id
    expect(new_space.city).to eq space.city
    expect(new_space.postcode).to eq space.postcode
    expect(new_space.space_created_date).to eq space.space_created_date
  end
end
