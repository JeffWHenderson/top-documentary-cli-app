class Controller
  def menu
    #Scraper.new.scrape
    puts "hello user what category would you like to browse?\n\n\n"
    Scraper.new.scrape_home_page
    puts "\n\nselect the number of the category you would like to browse" #Scraper.categories[0][0] #put this in a list categories method2
    input = gets.strip
    puts "you are browsing #{Scraper.categories[input.to_i - 1][1]}" # here you take user input and  open the category[input - 1][1]
    puts "type 'list' to go back to main, enter number for more information on a documentary"
    input = gets.strip
    puts "you chose #{input}"
  end

  # 1. scrape from https://topdocumentaryfilms.com/
  # 2. present a #menu
  # 3. gets user input
  # 4. shows #detail
end
