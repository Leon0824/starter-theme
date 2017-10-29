require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(10000)

def check_guess(guess)
  guess = guess.to_i
  if guess == 0
    # 
  elsif guess > SECRET_NUMBER * 5
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess * 5 < SECRET_NUMBER
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end