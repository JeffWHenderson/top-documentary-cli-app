class Scraper
attr_accessor

  def self.current_movies
    @@current_movies
  end

  def self.scrape_home_page(url = "https://topdocumentaryfilms.com/")
    doc = Nokogiri::HTML(open(url))
    category = doc.search("ul.cat-list a")
    category.each_with_index do |x, i|
      Category.new("#{x.text}", "#{x.attr('href')}")# << ["#{x.text}", "#{x.attr('href')}"]
    end
  end

  def self.scrape_category_url(category)
    doc = Nokogiri::HTML(open(category.url))
      details = doc.css("article.module")
      details.each do |x|
        rating =  x.css("span.archive_rating").text
        year_made = x.css(".meta-bar").text.strip.split(',')[0]
        title = x.css("h2").text
        movie_url = x.css("h2 a").attr("href")
        movie = Documentaries.new(rating, year_made, title, movie_url)
        category.add_movie(movie)
      end
  end
end
