require 'sinatra'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/test' do
    "Hello, world"
  end

  get '/' do
    @list = Bookmark.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    Bookmark.create(new_bookmark: params[:new_bookmark], title: params[:title])
    redirect '/'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/'
  end

  run! if app_file == $0

end
