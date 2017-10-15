class Controller
  def call
    list_categories
    menu
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip

      if input.to_i > 0 && input.to_i <= Scraper.categories.size
        puts "\t\t\t\n#{Scraper.categories[input.to_i - 1][0]}\n\n"
        make_selection(input.to_i)
        show_list

      elsif input == "list"
        call
      elsif input == "exit"
        goodbye
        input = exit
      else
        puts "\nDidn't understand input. please enter 'list', 'exit' or a valid number from the list"
      end #end of if statement
    end #end of while loop
  end #end of menu function

  def list_categories
    Scraper.new.scrape_home_page
    puts "select the number of the category you would like to browse or type 'exit'"
  end

  def make_selection(input)
    Scraper.new.scrape_category_url(Scraper.categories[input - 1][1])
  end

  def goodbye
    puts "\n\n\nThank you for your visit. come back soon!"
  end

  def show_list
    Documentaries.all.each_with_index do |documentary, index|
    puts "#{index + 1}.#{documentary.title}\n\t Rating: #{documentary.rating}\t Year made:#{documentary.year_made} \t\t\t #{documentary.movie_url}"
    end
    puts  "\n\nPlease enter 'list' for all categories, 'exit', a valid number from the category list, or click on link to watch!"
  end
end

# def make_selection(input)
#   puts "category : #{Scraper.categories[input - 1][0]}\n\n"
#   Scraper.new.scrape_category_url(Scraper.categories[input - 1][1])
#   puts "enter 'list' to see categories again or 'exit' to end"
# end
