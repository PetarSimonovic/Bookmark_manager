require 'pg'



feature 'Adding a new bookmark' do

  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Add')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    Bookmark.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')
    Bookmark.create(title: 'Google', url: 'http://www.google.com')

    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    end
  end

end

# feature 'Viewing bookmarks' do
#   scenario 'A user can see bookmarks' do
#     connection = PG.connect(dbname: 'bookmark_manager_test')
#
#     # Add the test data
#     visit('/bookmarks')
#
#     fill_in('url', with: 'http://www.makersacademy.com')
#     click_button('Add')
#
#     fill_in('url', with: 'http://www.destroyallsoftware.com')
#     click_button('Add')
#
#     fill_in('url', with: 'http://www.google.com')
#     click_button('Add')
#     expect(page).to have_content "http://www.makersacademy.com"
#
#     expect(page).to have_content "http://www.destroyallsoftware.com"
#     expect(page).to have_content "http://www.google.com"
#
#   end
#
# end
  #
  # feature "Adding bookmarks" do
  #   scenario "has a bookmark form" do
  #     visit('/bookmarks')
  #     click_button('Add')
  #   end
  #
  #   scenario "it can store a URL" do
  #     visit('/bookmarks')
  #     fill_in('url', with: 'http://testbookmark.co.uk')
  #     click_button('Add')
  #     expect(page).to have_content('http://testbookmark.co.uk')
  #   end
  #
  #
  #   scenario "it can store a title" do
  #     visit('/bookmarks')
  #     fill_in('title', with: 'Title Test')
  #     click_button('Add')
  #     expect(page).to have_content('Title Test')
  #   end
