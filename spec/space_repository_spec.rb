require_relative '../lib/space_repository'
require_relative '../lib/space'


RSpec.describe SpaceRepository do

    context "all method" do
        it "returns space records" do
            repo = SpaceRepository.new
            spaces = repo.all

            expect(spaces.name)
        end
    end

end