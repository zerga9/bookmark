require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/bookmarks' do
    bookmarks = ['http://google.com']
    bookmarks.join
  end
end
