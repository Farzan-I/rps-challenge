require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # our routes would go here
  get '/' do
    erb :index
  end

  enable :sessions

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    redirect to('/play')
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    erb :play
  end

  
  run! if app_file == $0
end
