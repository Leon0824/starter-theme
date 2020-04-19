require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(50)
@@guess_limit = 5
$background_color = ""

def check_guess(guess)
  guess = guess.to_i
  if guess == 0
    # 
  elsif guess > SECRET_NUMBER * 5
    $background_color = "red"
    "Way too high!"
  elsif guess > SECRET_NUMBER
    $background_color = "mistyrose"
    "Too high!"
  elsif guess * 5 < SECRET_NUMBER
    $background_color = "red"
    "Way too low!"
  elsif guess < SECRET_NUMBER
    $background_color = "mistyrose"
    "Too low!"
  else
    $background_color = "green"
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  @@guess_limit -= 1
  if @@guess_limit == 0
    SECRET_NUMBER = rand(50)
    @@guess_limit = 5
    message = "You've lost and a new number has been generated"
  end
  erb :index, :locals => {:message => message, :background_color => $background_color}
end