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

  def self.movies_made_after(year)
    #return all docs made after year_made
    list = self.all.find_all {|m| m.year_made.to_i > year}
    list.each.with_index(1) {|m, i| puts "#{i}. #{m.title} -- #{m.year_made} \n\t #{m.movie_url}" }
  end

end
