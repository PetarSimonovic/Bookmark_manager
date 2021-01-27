require_relative '../lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'contains some url bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      described_class.create('http://www.makersacademy.com')
      described_class.create('http://www.destroyallsoftware.com')
      described_class.create('http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end

  describe "Create" do
    it "creates a new bookmark" do
      described_class.create("testwebsite.co.uk")
      expect(described_class.all).to include("testwebsite.co.uk")
    end
  end

end
