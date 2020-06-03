require 'bookmark'

describe Bookmark do
  describe '.all' do
    it "should return all bookmarks" do
      # ENV['RACK_ENV'] = 'test'

      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end

  describe '.create' do
    it 'creates new bookmark' do
      Bookmark.create(link: 'http://www.theuselessweb.com')

      expect(Bookmark.all).to include 'http://www.theuselessweb.com'
    end
  end
end
