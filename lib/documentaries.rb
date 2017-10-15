class Documentaries
  attr_accessor :rating, :year_made, :title, :movie_url
  @@all = []

  def initialize(rating, year_made, title, movie_url)
       @rating = rating
       @year_made = year_made
       @title = title
       @movie_url = movie_url
       @@all << self
  end

  def self.reset!
    @@all = []
  end

  def self.all
    @@all
  end
end
