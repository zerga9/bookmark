feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://test4.com')
    fill_in('title', with: 'test4')
    click_button('Submit')

    expect(page).to have_content 'test4'
  end
  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    # expect(page).not_to have_content 'not a real bookmark'
    expect(page).to have_content 'You must submit a valid URL.'
  end
  scenario "User must enter title" do
    visit('/bookmarks/new')
    fill_in('url', with: "http://www.twitter.com")
    fill_in('title', with: '')
    click_button('Submit')
    # visit('/bookmarks/new')
    expect(page).to have_content 'You must submit a title.'

  end
  scenario 'There is a button to create bookmark' do
    visit '/bookmarks'
    expect(page).to have_button('create bookmark')
  end

  scenario "title is updated when url is already in database" do
  visit('/bookmarks/new')
  fill_in('url', with: "http://www.twitter.com")
  fill_in('title', with: 'twitter')
  click_button('Submit')
  visit('/bookmarks/new')
  fill_in('url', with: "http://www.twitter.com")
  fill_in('title', with: 'been here')
  click_button('Submit')
  expect(page).to have_link("been here", :href =>"http://www.twitter.com")

  end

  scenario 'there is a button to delete bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', with: "http://www.test12.com")
    fill_in('title', with: 'test12')
    click_button('Submit')
    expect(page).to have_button('Delete')
  end
  scenario 'Clicking the delete button, deletes the bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: "http://www.test13.com")
    fill_in('title', with: 'test13')
    click_button('Submit')
    click_button('Delete')
    expect(page).not_to have_link("test13", :href =>"http://www.test13.com")
  end

end
