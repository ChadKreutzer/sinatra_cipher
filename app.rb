require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'assets/ruby/caesar_cipher'

class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  @@caesar = Caesar.new

  get "/" do
    @output = @@caesar.code
    erb :index
  end

  post "/" do
    @@caesar.input = params[:source]
    @@caesar.shift = params[:encode].to_i

    redirect "/"
  end

end
