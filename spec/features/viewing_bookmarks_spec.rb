require 'pg'

feature 'Bookmark Manager' do
  scenario "it should produce bookmarks" do

    Bookmark.create(link: "http://www.makersacademy.com")
    Bookmark.create(link: "http://www.destroyallsoftware.com")
    Bookmark.create(link: "http://www.google.com")

    visit '/bookmarks'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
