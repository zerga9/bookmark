require 'pg'
feature 'View links' do
  scenario 'A user can see the database' do
    Bookmark.create('http://test1.com', 'test1')
    Bookmark.create('http://test2.com', 'test2')
    Bookmark.create('http://test3.com', 'test3')

    visit('/bookmarks')

    expect(page).to have_content 'test1'
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test3'
  end
  scenario "there is a hyperlink to the website" do

  end
end
