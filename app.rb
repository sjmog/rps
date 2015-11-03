require 'sinatra/base'
require './lib/turn'
require './lib/opponent'

class Rps < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:player_name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    @turn = Turn.new(session)
    @endgame_message = endgame_message
    erb :play
  end

  post '/play' do
    session[:player_shape] = params[:shape].downcase.to_sym
    session[:opponent_shape] = Opponent.new.shape
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  private

  def endgame_message
    if @turn.opponent_shape
      if @turn.draw?
        "You draw!"
      elsif @turn.win?
        "You win!"
      else
        "You lose!"
      end
    end
  end
end
