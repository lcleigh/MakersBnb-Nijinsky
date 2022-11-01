require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
#Please also add the following:
# Getter file for database class

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader

    get '/' do
      return erb(:index) # links to an index file with the html content
    end

  end
end
