require 'sinatra'

set :port, 3000
set :bind, '127.0.0.1'

class Craml
  def initialize
  end

  def to_s
    "I'll CRAML-ize ya!"
  end
end

get '/' do
  'face'
  craml = Craml.new
  "#{craml.to_s}"
end