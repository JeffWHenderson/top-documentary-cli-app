class Controller
  def call
    list_categories
    menu
  end

  def menu
    #Scraper.new.scrape
    input = nil
    while input != "exit"
      input = gets.strip

      if input.to_i > 0 && input.to_i <= Scraper.categories.size
        make_selection(input.to_i)
        puts "enter 'list' to see categories again or 'exit' to end"
      elsif input == "list"
        call
      elsif input == "exit"
        goodbye
        input = exit
      else
        puts "\nDidn't understand input. please enter 'list', 'exit' or a valid number from the list"
      end
    end
  end

  def list_categories
    Scraper.new.scrape_home_page
    puts "select the number of the category you would like to browse or type 'exit'"
  end

  def make_selection(input)
    puts "category : #{Scraper.categories[input - 1][0]}\n\n"
    Scraper.new.scrape_category_url(Scraper.categories[input - 1][1])
  end

  def goodbye
    puts "\n\n\nThank you for your visit. come back soon!"
  end

end

# def menu
#   #Scraper.new.scrape
#   input = nil
#   while input != "exit"
#     puts "\n\nselect the number of the category you would like to browse or type 'exit'"
#     input = gets.strip # i have to make it to integer but that gets rid of the exit functionality
#
#     if input.to_i > 0 && input.to_i < 26
#       make_selection(input.to_i)
#     else input != 'exit'
#       puts "not a valid input. please enter the number by the category you want"
#     end
#
#     puts "\n\n 'exit' to leave.  or you can enter 'list' for categories"
#     input = gets.strip
#     if input == 'list'
#       call
#     else
#       "invalid input. enter 'exit' to leave. or 'list' for categories"
#     end
#   end
# end
