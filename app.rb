require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add' do
    erb :add
  end
  
  post '/bookmarks' do
    Bookmark.create(link: params[:link])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
