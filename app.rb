require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/session'
require 'bcrypt'
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
    register Sinatra::Session
    also_reload 'lib/space_repository.rb'

    get '/' do
      return erb(:index) # links to an index file with the html content
    end

    get '/all_spaces' do
      # if session[:user_id] == nil
      #   # No user id in the session
      #   # so the user is not logged in.
      #   return redirect('/sign_in')
      # else
      #   # The user is logged in, display 
      #   # their account page.
      #   return erb(:account)
      # end
      repo = SpaceRepository.new
      @spaces = repo.all

      return erb(:all_spaces) # links to an index file with the html content
    end
    
    get '/all_spaces/new_space' do
      if session? == false
        redirect('/sign_in')
      else
        return erb(:new_space_form)
      end
      
    end

    get '/all_spaces/:id' do
      repo = SpaceRepository.new
      
      @space = repo.find(params[:id])
 
  
      return erb(:space)
    end

    post '/all_spaces' do
      if invalid_request_parameters?
        status 400
        return ''
      end


      repo = SpaceRepository.new
      new_space = Space.new
      new_space.name = params[:name]
      new_space.price = params[:price]
      new_space.description = params[:description]
      new_space.availability = [:availability]
      new_space.account_id = session[:user_id]
      
      repo.create(new_space)

      return erb(:space_added)
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
      session_start!
      session[:user_id] = @new_account.id
      return erb(:post_sign_up)
  
    end

    get '/sign_in' do
      return erb(:sign_in)
    end

    get '/user_homepage' do
      repo = SpaceRepository.new
      user_repo = AccountRepository.new

      @spaces = repo.all
      @user = user_repo.find(@spaces[0].account_id)

      return erb(:user_homepage)
    end

    post '/sign_in' do
      repo = AccountRepository.new
      @account = repo.find_by_email(params[:email])

      if BCrypt::Password.new(@account.password) == params[:password]
        session_start!
        session[:user_id] = @account.id
        return erb(:user_homepage)
      else
        return erb(:sign_in)
      end
    end
    
    get '/sign_out' do
      session_end!
      return erb(:sign_out)
    end

    get '/book' do
      repo = SpaceRepository.new
      @space = repo.all
      return erb(:book)
    end
    # return a POST method that allows user to book a space
    post '/all_spaces/:id/book' do
      repo = SpaceRepository.new
      @space = repo.find(params[:id])
      @space.availability = false
      repo.update(@space)
      return erb(:space_booked)
    end
    
    def invalid_request_parameters? 
      return params[:name]==nil || params[:price]==nil || params[:description]==nil || params[:availability]==nil
    end
  end
end
