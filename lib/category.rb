class Category
  attr_accessor :name, :url, :movies
  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @movies = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_movie(movie)
    @movies << movie unless @movies.size > 11
  end
end
