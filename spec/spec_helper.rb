require 'rspec'
require 'rack/test'
require_relative "../app"
Dir["./assets/ruby/*.rb"].each { |file_name| require file_name }

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() described_class end
end

RSpec.configure { |c| c.include RSpecMixin }