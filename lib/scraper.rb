class Scraper
attr_accessor
    @@categories = []

  def self.categories
    @@categories
  end

  def self.current_movies
    @@current_movies
  end

  def self.scrape_home_page(url = "https://topdocumentaryfilms.com/")
    doc = Nokogiri::HTML(open(url))
    category = doc.search("ul.cat-list a")
    category.each_with_index do |x, i|
      @@categories << ["#{x.text}", "#{x.attr('href')}"]
      puts "#{i + 1}. #{x.text}"
    end
  end

  def self.scrape_category_url(category_url = "https://topdocumentaryfilms.com/category/biography/")
    doc = Nokogiri::HTML(open(category_url))
      details = doc.css("article.module")
      Documentaries.reset!
      details.each do |x|
        rating =  x.css("span.archive_rating").text
        year_made = x.css(".meta-bar").text.strip.split(',')[0]
        title = x.css("h2").text
        movie_url = x.css("h2 a").attr("href")
        Documentaries.new(rating, year_made, title, movie_url)
      end
  end
end
