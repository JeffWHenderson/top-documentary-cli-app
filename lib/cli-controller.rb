require 'pry'

class Controller
  def call
    #Scraper.new
    Scraper.scrape_home_page
    list_categories
    menu
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Category.all.size
        category = Category.all[input.to_i - 1]
        puts "\t\t\t\n#{category.name}\n\n"
        make_selection(category)
        show_list(category)
      elsif input == "list"
        list_categories
      elsif input == "exit"
        goodbye
        input = exit
      else
        puts "\nDidn't understand input. please enter 'list', 'exit' or a valid number from the list"
      end #end of if statement
    end #end of while loop
  end #end of menu function

  def list_categories
    Category.all.each.with_index(1) {|x, i| puts "#{i}. #{x.name}"}  #Scraper.categories.each.with_index(1) {|category, i| puts "#{i}. #{category[0]}"}
    puts "select the number of the category you would like to browse or type 'exit'"
  end

  def make_selection(category)
    Scraper.scrape_category_url(category) #////// unless category exists ///////
  end

  def goodbye
    puts "\n\n\nThank you for your visit. come back soon!"
  end

  def show_list(category)
    category.movies.each_with_index do |documentary, index|
      puts "#{index + 1}.#{documentary.title}\n\t Rating: #{documentary.rating}\t Year made:#{documentary.year_made} \t\t\t #{documentary.movie_url}"
    end
    puts  "\n\nPlease enter 'list' for all categories, 'exit', a valid number from the category list, or click on link to watch!"
  end
end
