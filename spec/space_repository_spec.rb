require 'space'
require 'space_repository'

def reset_spaces_table
    seed_sql = File.read('seeds/seeds_spaces.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersBnB' })
    connection.exec(seed_sql)
end


RSpec.describe SpaceRepository do
before(:each) do 
  reset_spaces_table
end

    it 'Returns all spaces' do
        repo = SpaceRepository.new
        spaces = repo.all

        expect(spaces.length).to eq 2
        expect(spaces.first.name).to eq 'Treehouse'
        expect(spaces.first.price).to eq 200.00
        expect(spaces.first.description).to eq 'Sleep in the trees. See the animals.'
        expect(spaces.first.availability).to include ('SuperSaaS')
    end

   
end

    
    