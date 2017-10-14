require "nokogiri"
require "open-uri"

class Scraper
  def scrape_home_page(url = "https://topdocumentaryfilms.com/")
    doc = Nokogiri::HTML(open(url))
  end
end
