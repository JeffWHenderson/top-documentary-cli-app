class Controller
  def test_menu
    Scraper.new.scrape_category_url
  end

  def menu
    #Scraper.new.scrape
    puts "hello user what category would you like to browse?\n\n\n"
    Scraper.new.scrape_home_page
    puts "\n\nselect the number of the category you would like to browse" #Scraper.categories[0][0] #put this in a list categories method2

    input = gets.strip.to_i
    puts "category : #{Scraper.categories[input - 1][0]}\n\n"
    Scraper.new.scrape_category_url(Scraper.categories[input - 1][1])

    puts "\n\n type categories for all categories. type number of documentary for more info"
    input = gets.strip.to_i
    puts "MOVIE STORYLINE:"
    #Scraper.new.scrape_category_url(Scraper.categories[input - 1][1])

    puts "type anything to return to main page.  type exit to quit"
    input = gets.strip
    puts "you chose #{input}"
  end

  # 1. scrape from https://topdocumentaryfilms.com/
  # 2. present a #menu
  # 3. gets user input
  # 4. shows #detail
end
