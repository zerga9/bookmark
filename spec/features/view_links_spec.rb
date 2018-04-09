feature 'View links' do
  scenario 'A user can see the database' do
    visit '/bookmarks'

    expect(page).to have_content 'http://google.com'
  end
end
