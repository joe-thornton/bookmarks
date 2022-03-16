require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @list = Bookmarks.all
    erb :bookmarks
    # "List of Bookmarks"
  end

  get '/bookmarks/new' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    url = params[:url]
    Bookmarks.add(url)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
