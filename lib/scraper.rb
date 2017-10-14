require "nokogiri"
require "open-uri"

class Scraper
attr_accessor
    @@categories = []


  def scrape_home_page(url = "https://topdocumentaryfilms.com/")
    doc = Nokogiri::HTML(open(url))

    category = doc.search("ul.cat-list a")
    category.each_with_index do |x, i|
      @@categories << ["#{x.text}", "#{x.attr('href')}"]
      puts "#{i + 1}. #{x.text}"
    end
  end

  # def scrape_category_url(category_url = "https://topdocumentaryfilms.com/")
  #   doc = Nokogiri::HTML(open(category_url))
  #   puts doc.css("article.module")
  # end

  def self.categories
    @@categories
  end
end
