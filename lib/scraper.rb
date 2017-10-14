require "nokogiri"
require "open-uri"

class Scraper
attr_accessor
    @@categories = []
    @@current_movies = []


  def scrape_home_page(url = "https://topdocumentaryfilms.com/")
    doc = Nokogiri::HTML(open(url))

    category = doc.search("ul.cat-list a")
    category.each_with_index do |x, i|
      @@categories << ["#{x.text}", "#{x.attr('href')}"]
      puts "#{i + 1}. #{x.text}"
    end
  end

  def scrape_category_url(category_url = "https://topdocumentaryfilms.com/category/biography/")
    doc = Nokogiri::HTML(open(category_url))

      details = doc.css("article.module")
      details.each_with_index do |x, i|
        rating =  x.css("span.archive_rating").text
        year_made = x.css(".meta-bar").text.strip.split(',')[0]
        title = x.css("h2").text
        movie_url = x.css("h2 a").attr("href")
        @@current_movies << [title, movie_url]
        puts "#{i + 1}. #{title} \n     #{rating} stars \n     made in: #{year_made}\t\t\t Link to video: #{movie_url}"
    end
  end

  def self.categories
    @@categories
  end

  def self.current_movies
    @@current_movies
  end

  #I probably need to add #reset! for movie array.. if user reloads categories multiple times
end
