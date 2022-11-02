require 'account'
require 'account_repository'

def reset_accounts_table
  seed_sql = File.read('seeds/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'makersBnB' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  it 'finds all accounts' do
    repo = AccountRepository.new
    accounts = repo.all
    expect(accounts.length).to eq(2)
    expect(accounts.first.name).to eq('DannyW')
  end

  it 'finds a specific account' do
    repo = AccountRepository.new
    account = repo.find(2)
    expect(account.id).to eq(2)
    expect(account.name).to eq('TomD')
  end

  it 'creates a new account' do
    repo = AccountRepository.new
    account = Account.new
    account.name = 'AnnaO'
    account.password = 'password789'
    account.email = 'anna@makersbnb.com'
    account.phone = '07900900900'

    repo.create(account)
    accounts = repo.all

    expect(accounts.length).to eq(3)
    expect(accounts.last.name).to eq('AnnaO')
  end
end