require_relative '../lib/bookmark'

describe Bookmark do

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  # describe '.all' do

   # it 'creates a new bookmark' do
   #   connection = PG.connect(dbname: 'bookmark_manager_test')
   #
   #
   #   # Add the test data
   #   bookmark = Bookmark.create(title: "Makers Academy", url: "http://www.makersacademy.com")
   #   Bookmark.create(title: "Destroy All Software", url: "http://www.destroyallsoftware.com")
   #   Bookmark.create(title: "Google", url: "http://www.google.com")
   #
   #   bookmarks = Bookmark.all
   #
   #   expect(bookmarks.length).to eq 3
   #   expect(bookmarks.first).to be_a Bookmark
   #   expect(bookmarks.first.id).to eq bookmark.id
   #   expect(bookmarks.first.title).to eq 'Makers Academy'
   #   expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
   #  end

  end

  # describe '.all' do
  #   it 'contains some url bookmarks' do
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #
  #     described_class.create('Makers Academy', 'http://www.makersacademy.com')
  #     described_class.create('DestroyAllSoftware', 'http://www.destroyallsoftware.com')
  #     described_class.create('Google', 'http://www.google.com')
  #
  #     bookmarks = Bookmark.all
  #
  #     expect(bookmarks).to include('Makers Academy', 'http://www.makersacademy.com')
  #     expect(bookmarks).to include('DestroyAllSoftware', 'http://www.destroyallsoftware.com')
  #     expect(bookmarks).to include('Google', 'http://www.google.com')
  #   end
  # end
  #
  # describe "Create" do
  #   it "creates a new bookmark" do
  #     described_class.create('Test Website', "testwebsite.co.uk")
  #     expect(described_class.all).to include('Test Website', "testwebsite.co.uk")
  #   end
  # end
