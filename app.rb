require 'sinatra'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/test' do
    "Hello, world"
  end

  get '/' do
    erb(:index)
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    p "Added bookmark - title: #{params[:title]}, url: #{params[:url]} }"
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
