require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/space_repository'
require_relative 'lib/space'
require_relative 'lib/account_repository'
require_relative 'lib/account'

DatabaseConnection.connect('makersBnB')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/space_repository.rb'

    get '/' do
      return erb(:index) # links to an index file with the html content
    end

    get '/all_spaces' do
      repo = SpaceRepository.new
      @spaces = repo.all

      return erb(:all_spaces) # links to an index file with the html content
    end

    get '/all_spaces/:id' do
      repo = SpaceRepository.new
      # space_repo = ArtistRepository.new
  
      @space = repo.find(params[:id])
      # @artist = artist_repo.find(@album.artist_id)
  
      return erb(:space)
    end
  
    get '/sign_up' do
      return erb(:sign_up)
    end

    post '/sign_up' do
      repo = AccountRepository.new
  
      @new_account = Account.new
      @new_account.name = params[:name]
      @new_account.password = params[:password]
      @new_account.email = params[:email]
      @new_account.phone = params[:phone]
      
      repo.create(@new_account)
      return erb(:post_sign_up)
  
    end

    get '/sign_in' do
      return erb(:sign_in)
    end
  end
end
