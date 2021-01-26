require 'pg'

class Bookmark

  def self.all

    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")

    result.map { |bookmark| bookmark['url']}

  end


    # [
    #   "https://www.youtube.com" ,
    #   "https://www.google.co.uk" ,
    #   "https://www.bbc.co.uk"
    # ]
end
