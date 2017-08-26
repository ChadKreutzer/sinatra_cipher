require 'sinatra/base'
require_relative 'assets/ruby/caesar_cipher'

class MyApp < Sinatra::Base
  
  configure do
    set :protection, except: [:frame_options]
  end
  
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

    if params[:commit] == 'ENCODE'
      @@caesar.input = params[:source]
      @@caesar.shift = params[:encode].to_i
    elsif params[:commit] == 'DECODE'
      @@caesar.input = params[:source]
      @@caesar.shift = params[:encode].to_i * -1
    end

    redirect "/"
  end
end
