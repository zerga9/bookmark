require 'sinatra/base'
require './lib/bookmark'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    'Hello World'
  end

  post '/bookmarks' do
    flash[:notice] = 'You must submit a valid URL.' unless Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    flash[:notice].to_s if flash[:notice]
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  run! if app_file == $PROGRAM_NAME
end
