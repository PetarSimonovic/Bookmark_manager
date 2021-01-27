require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    visit('bookmarks')

    fill_in('new_bookmark', with: 'http://www.makersacademy.com')
    click_button('Add')
    expect(page).to have_content "http://www.makersacademy.com"

    fill_in('new_bookmark', with: 'http://www.destroyallsoftware.com')
    click_button('Add')
    expect(page).to have_content "http://www.destroyallsoftware.com"

    fill_in('new_bookmark', with: 'http://www.google.com')
    click_button('Add')
    expect(page).to have_content "http://www.google.com"
    
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
      click_button('Add')
      expect(page).to have_content('http://bbc.co.uk')
    end

end
