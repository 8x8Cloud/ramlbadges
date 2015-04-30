require 'sinatra'
require 'json'
require_relative './craml.rb'

use Rack::Logger

set :port, 3000
set :bind, '127.0.0.1'

get '/' do
  craml = Craml.new
  logger.info "#{craml.to_s}"
end

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
end