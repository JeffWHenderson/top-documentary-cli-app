class Controller
  def call
    list_categories
    menu
    goodbye
  end

  def menu
    #Scraper.new.scrape
    input = nil
    while input != 'exit'
      puts "\n\nselect the number of the category you would like to browse or type 'exit'"
      input = gets.strip # i have to make it to integer but that gets rid of the exit functionality

      # if input.to_i > 0 && input.to_i < 26
      #   input = input.to_i
      #   puts "category : #{Scraper.categories[input - 1][0]}\n\n"
      #   Scraper.new.scrape_category_url(Scraper.categories[input - 1][1])
      # elsif input != 'exit'
      #   puts "not a valid input. please enter the number by the category you want"
      #   menu
      # else
      #   goodbye
      # end
      #
      # puts "\n\n 'exit' to leave.  or you can enter 'list' for categories"
      # input = gets.strip
      # if input == 'list'
      #   puts "#{input}"#call
      # else
      #   "invalid input. enter 'exit' to leave. or 'list' for categories"
      # end
    end
  end

  def list_categories
    Scraper.new.scrape_home_page
  end

  def goodbye
    puts "\n\n\ncome back soon"
  end

end
