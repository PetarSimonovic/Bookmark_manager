require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
  Bookmark.create(new_bookmark: 'http://www.makersacademy.com', title: 'Makers Academy')
  Bookmark.create(new_bookmark: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
  Bookmark.create(new_bookmark: 'http://www.google.com', title: 'Google')

  visit '/bookmarks'

  expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
  expect(page).to have_link('Google', href: 'http://www.google.com')

  end

end

  feature "Adding bookmarks" do
    scenario "can add a bookmark with a form" do
      visit('/bookmarks')
      click_button('Add')
    end

    scenario "it can store a bookmark" do
      visit('/bookmarks')
      fill_in('new_bookmark', with: 'http://bbc.co.uk')
      fill_in('title', with: 'BBC')
      click_button('Add')
      expect(page).to have_content('BBC')
    end

end
