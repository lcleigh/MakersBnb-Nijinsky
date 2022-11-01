require 'space'

class SpaceRepository
    
    def all
        spaces = []

        sql = 'SELECT name, price, description, availability FROM spaces;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |item|
            space = Space.new
            space.id = item['id'].to_i
            space.name = item['name']
            space.price = item['price'].to_f
            space.description = item['description']
            space.availability = item['availability']
      
            spaces << space

        end

        return spaces
    end
end
