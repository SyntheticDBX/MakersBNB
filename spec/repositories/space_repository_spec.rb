require_relative '../../lib/space_repository'
require_relative '../../lib/space'
require_relative '../../lib/database_connection'

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
      expect(spaces[1].dates_available).to eq '28-7-22,29-7-22,30-7-22,31-7-22,1-8-22,2-8-22,3-8-22,4-8-22,5-8-22,6-8-22,7-8-22,8-8-22,9-8-22,10-8-22,11-8-22,12-8-22,13-8-22,14-8-22,15-8-22,16-8-22,17-8-22,18-8-22,19-8-22,20-8-22,21-8-22,22-8-22,23-8-22,24-8-22,25-8-22,26-8-22,27-8-22,28-8-22,29-8-22,30-8-22,31-8-22,1-9-22,2-9-22,3-9-22,4-9-22,5-9-22,6-9-22,7-9-22,8-9-22,9-9-22,10-9-22,11-9-22,12-9-22,13-9-22,14-9-22,15-9-22,16-9-22,17-9-22,18-9-22,19-9-22,20-9-22,21-9-22,22-9-22,23-9-22,24-9-22,25-9-22,26-9-22,27-9-22,28-9-22,29-9-22,30-9-22,1-10-22,2-10-22,3-10-22,4-10-22,5-10-22,6-10-22,7-10-22,8-10-22,9-10-22,10-10-22,11-10-22,12-10-22,13-10-22,14-10-22,15-10-22,16-10-22,17-10-22,18-10-22,19-10-22,20-10-22,21-10-22,22-10-22,23-10-22,24-10-22,25-10-22,26-10-22,27-10-22,28-10-22,29-10-22,30-10-22,31-10-22,1-11-22,2-11-22,3-11-22,4-11-22,5-11-22,6-11-22,7-11-22,8-11-22,9-11-22,10-11-22,11-11-22,12-11-22,13-11-22,14-11-22,15-11-22,16-11-22,17-11-22,18-11-22,19-11-22,20-11-22,21-11-22,22-11-22,23-11-22,24-11-22,25-11-22,26-11-22,27-11-22,28-11-22,29-11-22,30-11-22,1-12-22,2-12-22,3-12-22,4-12-22,5-12-22,6-12-22,7-12-22,8-12-22,9-12-22,10-12-22,11-12-22,12-12-22,13-12-22,14-12-22,15-12-22,16-12-22,17-12-22,18-12-22,19-12-22,20-12-22,21-12-22,22-12-22,23-12-22,24-12-22,25-12-22,26-12-22,27-12-22,28-12-22,29-12-22,30-12-22,31-12-22,1-1-23,2-1-23,3-1-23,4-1-23,5-1-23,6-1-23,7-1-23,8-1-23,9-1-23,10-1-23,11-1-23,12-1-23,13-1-23,14-1-23,15-1-23,16-1-23,17-1-23,18-1-23,19-1-23,20-1-23,21-1-23,22-1-23,23-1-23,24-1-23,25-1-23,26-1-23,27-1-23,28-1-23,29-1-23,30-1-23,31-1-23,1-2-23,2-2-23,3-2-23,4-2-23,5-2-23,6-2-23,7-2-23,8-2-23,9-2-23,10-2-23,11-2-23,12-2-23,13-2-23,14-2-23,15-2-23,16-2-23,17-2-23,18-2-23,19-2-23,20-2-23,21-2-23,22-2-23,23-2-23,24-2-23,25-2-23,26-2-23,27-2-23,28-2-23,1-3-23,2-3-23,3-3-23,4-3-23,5-3-23,6-3-23,7-3-23,8-3-23,9-3-23,10-3-23,11-3-23,12-3-23,13-3-23,14-3-23,15-3-23,16-3-23,17-3-23,18-3-23,19-3-23,20-3-23,21-3-23,22-3-23,23-3-23,24-3-23,25-3-23,26-3-23,27-3-23,28-3-23,29-3-23,30-3-23,31-3-23,1-4-23,2-4-23,3-4-23,4-4-23,5-4-23,6-4-23,7-4-23,8-4-23,9-4-23,10-4-23,11-4-23,12-4-23,13-4-23,14-4-23,15-4-23,16-4-23,17-4-23,18-4-23,19-4-23,20-4-23,21-4-23,22-4-23,23-4-23,24-4-23,25-4-23,26-4-23,27-4-23,28-4-23,29-4-23,30-4-23,1-5-23,2-5-23,3-5-23,4-5-23,5-5-23,6-5-23,7-5-23,8-5-23,9-5-23,10-5-23,11-5-23,12-5-23,13-5-23,14-5-23,15-5-23,16-5-23,17-5-23,18-5-23,19-5-23,20-5-23,21-5-23,22-5-23,23-5-23,24-5-23,25-5-23,26-5-23,27-5-23,28-5-23,29-5-23,30-5-23,31-5-23,1-6-23,2-6-23,3-6-23,4-6-23,5-6-23,6-6-23,7-6-23,8-6-23,9-6-23,10-6-23,11-6-23,12-6-23,13-6-23,14-6-23,15-6-23,16-6-23,17-6-23,18-6-23,19-6-23,20-6-23,21-6-23,22-6-23,23-6-23,24-6-23,25-6-23,26-6-23,27-6-23,28-6-23,29-6-23,30-6-23,1-7-23,2-7-23,3-7-23,4-7-23,5-7-23,6-7-23,7-7-23,8-7-23,9-7-23,10-7-23,11-7-23,12-7-23,13-7-23,14-7-23,15-7-23,16-7-23,17-7-23,18-7-23,19-7-23,20-7-23,21-7-23,22-7-23,23-7-23,24-7-23,25-7-23,26-7-23,27-7-23,28-7-23,29-7-23,30-7-23,31-7-23,1-8-23,2-8-23,3-8-23,4-8-23,5-8-23,6-8-23,7-8-23,8-8-23,9-8-23,10-8-23,11-8-23,12-8-23,13-8-23'
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
    repo = SpaceRepository.new
    space = {}
    space["name"] = 'Hemigraphis reptans'
    space["description"] = 'Anyway you want it'
    space["user_id"] = 3
    space["first_line_address"] = 'Mifflin'
    space["second_line_address"] = '2nd Floor'
    space["city"] = 'Overyata'
    space["country"] = 'Russia'
    space["postcode"] = '617071'
    space["space_created_date"] = '2020-07-17'
    space["price_per_night"] = 159
    space["dates_available"] = "28-7-22,29-7-22,30-7-22,31-7-22,1-8-22,2-8-22,3-8-22,4-8-22,5-8-22,6-8-22,7-8-22,8-8-22,9-8-22,10-8-22,11-8-22,12-8-22,13-8-22,14-8-22,15-8-22,16-8-22,17-8-22,18-8-22,19-8-22,20-8-22,21-8-22,22-8-22,23-8-22,24-8-22,25-8-22,26-8-22,27-8-22,28-8-22,29-8-22,30-8-22,31-8-22,1-9-22,2-9-22,3-9-22,4-9-22,5-9-22,6-9-22,7-9-22,8-9-22,9-9-22,10-9-22,11-9-22,12-9-22,13-9-22,14-9-22,15-9-22,16-9-22,17-9-22,18-9-22,19-9-22,20-9-22,21-9-22,22-9-22,23-9-22,24-9-22,25-9-22,26-9-22,27-9-22,28-9-22,29-9-22,30-9-22,1-10-22,2-10-22,3-10-22,4-10-22,5-10-22,6-10-22,7-10-22,8-10-22,9-10-22,10-10-22,11-10-22,12-10-22,13-10-22,14-10-22,15-10-22,16-10-22,17-10-22,18-10-22,19-10-22,20-10-22,21-10-22,22-10-22,23-10-22,24-10-22,25-10-22,26-10-22,27-10-22,28-10-22,29-10-22,30-10-22,31-10-22,1-11-22,2-11-22,3-11-22,4-11-22,5-11-22,6-11-22,7-11-22,8-11-22,9-11-22,10-11-22,11-11-22,12-11-22,13-11-22,14-11-22,15-11-22,16-11-22,17-11-22,18-11-22,19-11-22,20-11-22,21-11-22,22-11-22,23-11-22,24-11-22,25-11-22,26-11-22,27-11-22,28-11-22,29-11-22,30-11-22,1-12-22,2-12-22,3-12-22,4-12-22,5-12-22,6-12-22,7-12-22,8-12-22,9-12-22,10-12-22,11-12-22,12-12-22,13-12-22,14-12-22,15-12-22,16-12-22,17-12-22,18-12-22,19-12-22,20-12-22,21-12-22,22-12-22,23-12-22,24-12-22,25-12-22,26-12-22,27-12-22,28-12-22,29-12-22,30-12-22,31-12-22,1-1-23,2-1-23,3-1-23,4-1-23,5-1-23,6-1-23,7-1-23,8-1-23,9-1-23,10-1-23,11-1-23,12-1-23,13-1-23,14-1-23,15-1-23,16-1-23,17-1-23,18-1-23,19-1-23,20-1-23,21-1-23,22-1-23,23-1-23,24-1-23,25-1-23,26-1-23,27-1-23,28-1-23,29-1-23,30-1-23,31-1-23,1-2-23,2-2-23,3-2-23,4-2-23,5-2-23,6-2-23,7-2-23,8-2-23,9-2-23,10-2-23,11-2-23,12-2-23,13-2-23,14-2-23,15-2-23,16-2-23,17-2-23,18-2-23,19-2-23,20-2-23,21-2-23,22-2-23,23-2-23,24-2-23,25-2-23,26-2-23,27-2-23,28-2-23,1-3-23,2-3-23,3-3-23,4-3-23,5-3-23,6-3-23,7-3-23,8-3-23,9-3-23,10-3-23,11-3-23,12-3-23,13-3-23,14-3-23,15-3-23,16-3-23,17-3-23,18-3-23,19-3-23,20-3-23,21-3-23,22-3-23,23-3-23,24-3-23,25-3-23,26-3-23,27-3-23,28-3-23,29-3-23,30-3-23,31-3-23,1-4-23,2-4-23,3-4-23,4-4-23,5-4-23,6-4-23,7-4-23,8-4-23,9-4-23,10-4-23,11-4-23,12-4-23,13-4-23,14-4-23,15-4-23,16-4-23,17-4-23,18-4-23,19-4-23,20-4-23,21-4-23,22-4-23,23-4-23,24-4-23,25-4-23,26-4-23,27-4-23,28-4-23,29-4-23,30-4-23,1-5-23,2-5-23,3-5-23,4-5-23,5-5-23,6-5-23,7-5-23,8-5-23,9-5-23,10-5-23,11-5-23,12-5-23,13-5-23,14-5-23,15-5-23,16-5-23,17-5-23,18-5-23,19-5-23,20-5-23,21-5-23,22-5-23,23-5-23,24-5-23,25-5-23,26-5-23,27-5-23,28-5-23,29-5-23,30-5-23,31-5-23,1-6-23,2-6-23,3-6-23,4-6-23,5-6-23,6-6-23,7-6-23,8-6-23,9-6-23,10-6-23,11-6-23,12-6-23,13-6-23,14-6-23,15-6-23,16-6-23,17-6-23,18-6-23,19-6-23,20-6-23,21-6-23,22-6-23,23-6-23,24-6-23,25-6-23,26-6-23,27-6-23,28-6-23,29-6-23,30-6-23,1-7-23,2-7-23,3-7-23,4-7-23,5-7-23,6-7-23,7-7-23,8-7-23,9-7-23,10-7-23,11-7-23,12-7-23,13-7-23,14-7-23,15-7-23,16-7-23,17-7-23,18-7-23,19-7-23,20-7-23,21-7-23,22-7-23,23-7-23,24-7-23,25-7-23,26-7-23,27-7-23,28-7-23,29-7-23,30-7-23,31-7-23,1-8-23,2-8-23,3-8-23,4-8-23,5-8-23,6-8-23,7-8-23,8-8-23,9-8-23,10-8-23,11-8-23,12-8-23,13-8-23"
    repo.create(space)
    new_space = repo.find(6)

    expect(new_space.user_id).to eq space["user_id"]
    expect(new_space.city).to eq space["city"]
    expect(new_space.postcode).to eq space["postcode"]
    expect(new_space.space_created_date).to eq space["space_created_date"]
  end
end