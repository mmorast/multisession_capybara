require 'sinatra'

class MultisessionRackapp < Sinatra::Base
  get '/' do
    "Hello World #{params[:name]}".strip
  end

  get '/nav_test' do
    'Confirmed navigation'
  end
end