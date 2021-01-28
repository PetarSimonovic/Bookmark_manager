require 'sinatra'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/test' do
    "Hello, world"
  end

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    Bookmark.create(new_bookmark: params[:new_bookmark], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
