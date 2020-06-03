
feature 'visit add page' do
  scenario 'click add link' do
    visit '/'
    click_button('Add Link')
  end
end

feature 'adding Bookmark' do
  scenario 'enter a bookmark and submit' do
    visit '/add'
    fill_in('link', with: 'http://www.theuselessweb.com')
    click_button('Save')
    # expect(page).to have_content 'http://www.theuselessweb.com'
  end
end

