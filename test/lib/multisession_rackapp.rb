require 'sinatra'

class MultisessionRackapp < Sinatra::Base
  get '/' do
    "Hello World #{params[:name]}".strip
  end
end