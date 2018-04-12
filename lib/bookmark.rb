require 'pg'

class Bookmark
  def self.all
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['title'] }
  end
  def self.display
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| "<a href=" + bookmark['url'] + ">" + bookmark['title'] + "</a>" }
  end

  def self.create(link, title)
    return false unless is_url?(link) && title?(title)
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                end
    connection.exec("INSERT INTO BOOKMARKS(url, title) VALUES('#{link}', '#{title}')")
  end
  def self.url
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI.regexp(%w[http https])}\z/
  end
  def self.title?(title)
    if title.length > 0
      return true
    end
  end
end
