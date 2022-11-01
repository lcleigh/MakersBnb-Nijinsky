require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/space_repository'
require_relative 'lib/space'

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

    get '/spaces' do
      repo = SpaceRepository.new
      @spaces = repo.all

      return erb(:spaces) # links to an index file with the html content
    end
  end
end
