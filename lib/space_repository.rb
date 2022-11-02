require_relative 'space'

class SpaceRepository
    
    def all
        spaces = []

        sql = 'SELECT id, name, price, description, availability FROM spaces;'
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

    def find(id)
        sql = 'SELECT id, name, price, description, availability FROM spaces WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])
    
        space = Space.new
        space.id = result_set[0]['id'].to_i
        space.name = result_set[0]['name']
        space.price = result_set[0]['price']
        space.description = result_set[0]['description']
        space.availability = result_set[0]['availability']
    
        return space
    end
end
