class Controller
  def menu
    #Scraper.new.scrape
    puts "hello user what category would you like to browse\n\n\n"
    input = gets.strip
    puts "you are browsing #{input}"
    puts "options in chosen category"
  end

  # 1. scrape from https://topdocumentaryfilms.com/
  # 2. present a #menu
  # 3. gets user input
  # 4. shows #detail
end
