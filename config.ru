require 'bundler'
Bundler.setup :default
Bundler.require
Dir["./models/*.rb"].each {|file| require file }
require './app'

use Rack::MethodOverride

map '/assets/' do
  environment = Sprockets::Environment.new
  environment.js_compressor  = :uglify
  environment.css_compressor = :scss
  ASSET_PATH =  [ 'assets/javascripts',
                  'assets/stylesheets',
                  'assets/fonts',
                  'public/images'
                ]
  ASSET_PATH.each { |path_name| environment.append_path path_name }
  run environment
end

run Rack::URLMap.new({
  "/" => MyApp
})