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
    Bookmark.create('http://bbc.com', 'bbc')
    visit('/bookmarks')
    expect(page).to have_link("bbc", :href =>"http://bbc.com")
  end
  scenario "The user can delete a bookmark" do
    Bookmark.create('http://test11.com', 'test11')
    Bookmark.delete('http://test11.com')
    visit('/bookmarks')

    expect(page).not_to have_link("test11", :href =>"http://test11.com")
  end

end
