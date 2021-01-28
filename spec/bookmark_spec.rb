require_relative '../lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'contains some url bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

        bookmark = Bookmark.create(new_bookmark: "http://www.makersacademy.com", title: "Makers Academy")
        Bookmark.create(new_bookmark: "http://www.destroyallsoftware.com", title: "Destroy All Software")
        Bookmark.create(new_bookmark: "http://www.google.com", title: "Google")

        bookmarks = Bookmark.all

        expect(bookmarks.length).to eq 3
        expect(bookmarks.first).to be_a Bookmark
        expect(bookmarks.first.id).to eq bookmark.id
        expect(bookmarks.first.title).to eq 'Makers Academy'
        expect(bookmarks.first.new_bookmark).to eq 'http://www.makersacademy.com'

    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(new_bookmark: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

end
