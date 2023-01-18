require_relative '../lib/space_repository'
require_relative '../lib/space'
require_relative '../lib/database_connection'

def reset_space_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
end

RSpec.describe SpaceRepository do

    before(:each) do 
        reset_space_table
    end

    context "all method" do
        repo = SpaceRepository.new
        spaces = repo.all

        it "returns all space records" do
            expect(spaces[1].name).to eq "Nemacladus interior (Munz) G.T. Robbins"
            expect(spaces[2].city).to eq "Lusacan"
            expect(spaces[3].price_per_night).to eq 474.42
            expect(spaces[4].user_id).to eq 5
        end
        it "should return length of 5" do
            expect(spaces.length).to eq 5
        end

    end

    context "find(id) method returns space by id" do
        repo = SpaceRepository.new

        it "returns space with id 5" do
            space = repo.find(5)
            expect(space.name).to eq "Huperzia ×erubescens (Brack.) Holub (pro sp.)"
            expect(space.postcode).to eq "44695000"
            expect(space.space_created_date).to eq "2019-11-10"
        end

        it "returns space with id 3" do
            space = repo.find(3)
            expect(space.name).to eq "Lecidea lepidastra (Tuck.) Hasse"
            expect(space.postcode).to eq "4325"
            expect(space.space_created_date).to eq "2020-01-21"
        end
    end

    it "creates new space" do
        space = Space.new
        space.name = 'Hemigraphis reptans (G. Forst.) T. Anderson ex Hemsl.'
        space.description = 'Anyway you want it'
        space.user_id = 3
        space.first_line_address = 'Mifflin'
        space.second_line_address =  '2nd Floor'
        space.city = 'Overyata'
        space.country = 'Russia'
        space.postcode = '617071'
        space.space_created_date = '2020-07-17'
        space.price_per_night =  159.03
        repo = SpaceRepository.new
        repo.create(space)
        new_space = repo.find(6)

        expect(new_space.user_id).to eq space.user_id
        expect(new_space.city).to eq "Overyata"
        expect(new_space.postcode).to eq "617071"
        expect(new_space.space_created_date). to eq '2020-07-17'
    end
end
