require_relative 'space'

class SpaceRepository
    
    def all
        spaces = []

        sql = 'SELECT id, name, price, description, availability, account_id FROM spaces;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |item|
            space = Space.new
            space.id = item['id'].to_i
            space.name = item['name']
            space.price = item['price'].to_f
            space.description = item['description']
            space.availability = item['availability']
            space.account_id = item['account_id'].to_i
      
            spaces << space
        end

        return spaces
    end

    def find(id)
        sql = 'SELECT id, name, price, description, availability, account_id FROM spaces WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])
    
        space = Space.new
        space.id = result_set[0]['id'].to_i
        space.name = result_set[0]['name']
        space.price = result_set[0]['price']
        space.description = result_set[0]['description']
        space.availability = result_set[0]['availability']
        space.account_id = result_set[0]['account_id'].to_i
    
        return space
    end

    def create(space)
        sql = 'INSERT INTO spaces (name, price, description, availability, account_id) VALUES ($1, $2,$3, $4, $5);'
        result_set = DatabaseConnection.exec_params(sql, [space.name, space.price, space.description, space.availability, space.account_id])

        return space
    end

    def edit(space)
        sql = 'UPDATE spaces SET name = $1, price = $2, description = $3, availability = $4 WHERE id = $5;'
        result_set = DatabaseConnection.exec_params(sql, [space.name, space.price, space.description, space.availability, space.id])
    end

    def delete(id)
        sql = 'DELETE FROM spaces WHERE id = $1;';
        DatabaseConnection.exec_params(sql, [id]);
    end
end
