require 'sinatra/base'
require './lib/bookmark'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect('/bookmarks')
  end

  post '/bookmarks' do
    flash[:notice] = 'You must submit a valid URL.' unless Bookmark.is_url?(params['url'])
    flash[:notice2] = "You must submit a title." unless Bookmark.title?(params['title'])
    # flash[:notice3] =
    if (Bookmark.is_url?(params['url'])) && (Bookmark.title?(params['title']))
       Bookmark.create(params['url'], params['title'])
    end
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    # flash[:notice].to_s if flash[:notice]

    @bookmarks = Bookmark.all
    @urls = Bookmark.display
    erb :"bookmarks/index"

  end

  get '/bookmarks/new' do
    # flash[:notice2].to_s if flash[:notice2]
    erb :"bookmarks/new"



  end

  post '/bookmarks/new' do
    # flash[:notice2] = "You must submit a title." unless Bookmark.title?(params['title'])
    erb :"bookmarks/new"
    redirect '/bookmarks'

  end
  post '/bookmarks/delete' do
    p params
    # Bookmark.delete(params['url'])
    Bookmark.delete(params.key('Delete'))

    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
