require_relative '../lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'contains some url bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.youtube.com")
      expect(bookmarks).to include("http://www.google.co.uk")
      expect(bookmarks).to include("http://www.bbc.co.uk")
    end
  end
end
