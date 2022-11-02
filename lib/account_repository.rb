require_relative 'account'

class AccountRepository
    
    def all
        accounts = []

        sql = 'SELECT id, name, password, email, phone FROM accounts;'
        accounts_set = DatabaseConnection.exec_params(sql, [])

        accounts_set.each do |item|
            account = Account.new
            account.id = item['id'].to_i
            account.name = item['name']
            account.password = item['password']
            account.email = item['email']
            account.phone = item['phone']
      
            accounts << account
        end

        return accounts
    end

    def find(id)
        sql = 'SELECT id, name, password, email, phone FROM accounts WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])
    
        account = Account.new
        account.id = result_set[0]['id'].to_i
        account.name = result_set[0]['name']
        account.password = result_set[0]['password']
        account.email = result_set[0]['email']
        account.phone = result_set[0]['phone']
    
        return account
    end

    def create(account)
        sql = 'INSERT INTO accounts (name, password, email, phone) VALUES ($1, $2, $3, $4);'
        result_set = DatabaseConnection.exec_params(
            sql, [account.name, account.password, 
            account.email, account.phone]
        )
    end
end
