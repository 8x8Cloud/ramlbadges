
require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json'
require 'json/ext' # required for .to_json

Bundler.require(:default)

include Mongo

# require_relative './craml.rb'

# use Rack::Logger

configure do
  conn = MongoClient.new("localhost", 27017)
  set :mongo_connection, conn
  set :mongo_db, conn.db('test')
end

set :port, 3000
set :bind, '127.0.0.1'

get '/' do
  "Hey ... you've arrive"
  # craml = Craml.new
  # logger.info "#{craml.to_s}"
end

get '/collections/?' do
  content_type :json
  settings.mongo_db.collection_names.to_json
end

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
end