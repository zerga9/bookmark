require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks title in an array' do
      Bookmark.create('http://test1.com', 'makersacademy')
      Bookmark.create('http://test2.com', 'destroyallsoftware')
      Bookmark.create('http://test3.com', 'google')

      expected_bookmarks = %w[
        makersacademy
        destroyallsoftware
        google
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end
  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create('http://www.test4.com', 'test4')

      expect(Bookmark.all).to include 'test4'
    end
    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create('not a real bookmark', 'not a real title')

      expect(Bookmark.all).not_to include 'not a real bookmark'
    end
  end
end
