require 'pg'

class Bookmark

  attr_reader :id, :title, :new_bookmark

  def initialize(id:, title:, new_bookmark:)
    @id = id
    @title = title
    @new_bookmark = new_bookmark
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end


    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
       Bookmark.new(id: bookmark['id'], title: bookmark['title'], new_bookmark: bookmark['url'])
    end
  end

  def self.create(new_bookmark:, title:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{new_bookmark}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], new_bookmark: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

end
