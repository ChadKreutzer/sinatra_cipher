require 'sinatra/base'
require_relative 'assets/ruby/caesar_cipher'

class MyApp < Sinatra::Base
  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  @@caesar = Caesar.new "Your message will appear here!"

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
