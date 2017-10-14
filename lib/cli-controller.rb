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

    puts "\n\n enter movie number if you want a link.  'exit' to leave.  or you can enter 'list' for categories"
    input = gets.strip.to_i
    #show movie objects url
    #or go to list
    #or exit
    #this loop will end my program
  end

end
