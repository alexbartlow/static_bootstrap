require "rubygems"
require "bundler/setup"
require 'rack'
require 'sinatra/base'
require 'coffee-script'
require 'slim'
Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| STDERR.puts f ; require f}

def File.slideify(path)
  File.read(path).gsub(/</, '&lt;').gsub(/>/, '&gt;').gsub(/\[/, '<').gsub(/\]/, '>')
end

class App < Sinatra::Base
  helpers Helpers::Links
  set :slim, :layout_engine => :erb, :layout => :layout
  get '/' do
    slim :index
  end

  get '/:path' do
    erb params[:path].to_sym rescue slim params[:path].to_sym
  end

  get '/coffeescripts/:path' do
    coffee params[:path].to_sym
  end
end

map '/' do
  run App.new
end



