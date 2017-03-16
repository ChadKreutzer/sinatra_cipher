require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'assets/ruby/caesar_cipher'

class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  @@caesar = Caesar.new
  @@source = "Caesar's Cipher"
  @@encode = 0
  
  get "/" do
    
    @output = @@caesar.cipher(@@source, @@encode)
    @@caesar = Caesar.new
    erb :index
  end
  
  post "/" do
    @@source = params[:source]
    @@encode = params[:encode].to_i
    
    redirect "/"
  end
    
end