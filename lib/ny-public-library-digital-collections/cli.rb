# My Controller.
require 'pry'

class  NYPLDC::CLI

  def call
    NYPLDC::Scraper.scrape_collections
    puts ""
    puts ""
    puts ">> Welcome to the New York Public Library: Digital Collections <<"
    puts ""
    collections_menu
    #see_you_later
  end

  def collections_menu

    puts ""
    puts "~~~~~~~~~~~~~Poster Collections~~~~~~~~~~~~~~~"
    puts ""

    NYPLDC::Collection.all.each_with_index {|collection, index| puts "#{index+1}.#{collection.name.upcase}"}

    puts ""
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "|HOME| |'exit'|"
    puts ""
    puts "Enter the number of the collection you would like to view or 'exit':"
    puts ""
    puts ""

    input = gets.strip
    case input 
    when ("1".."21")
      puts ""
      posters_menu(input)
    when "exit"
      see_you_later
    else
      puts ""
      puts ""
      puts "I can't do that. Please, try again."
      puts ""
      puts ""
    end
  end

  def posters_menu(input)

    current_collection =  NYPLDC::Collection.find(input.to_i)
    NYPLDC::Scraper.scrape_posters(current_collection)
    current_collection_posters = current_collection.posters

    puts ""
    puts ""
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "A - B - C - D - E - F - G - H - I - J - K - L - M" 
    puts ""
    puts "N - O - P - Q - R - S - T - U - V - W - X - Y - Z"
    puts
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts ""
    puts "|'home'|  |'back'|  |#{current_collection.name.upcase}|  |'exit'|"
    puts ""
    puts "Enter a letter to view."
    puts ""
    puts ""

    while input != "exit"
    input = gets.strip.downcase
      case input
      when ("a".."z")
        def find_by_first_letter(posters, input)
          posters.select {|poster| poster.title.downcase.start_with?(input)}
        end
        posters_by_letter = find_by_first_letter(current_collection_posters, input)

        puts ""
        puts ""
        puts ""

        print_posters(posters_by_letter)
      
        puts ""
        puts ""
        puts "|'home'|  |'back'|  |#{current_collection.name}|  |'exit'|"
        puts ""

      when "back"
        puts ""
        puts ""

        posters_menu(input)

        puts ""
        puts ""
      when "home"
        puts ""
        puts ""

        collections_menu

        puts ""
        puts ""

      when "exit"
        puts ""
        see_you_later
        puts ""
      else 
        puts ""
        puts ""
        puts "I can't do that. Please, try again."
        puts ""
        puts ""
        puts ""
      end
    end
  end

  # def posters

    # def find_by_first_letter(posters, input)
    #   posters.select {|poster| poster.title.downcase.start_with?(input)}
    # end
    # posters_by_letter = find_by_first_letter(current_collection_posters, input)

    # puts ""
    # puts ""
    # puts ""

    # print_posters(posters_by_letter)

    # puts ""
    # puts ""
    # puts "|'home'|  |'back'|  |#{current_collection.name}|  |'exit'|"
    # puts ""

  #   input = nil
  #   while input != "exit"
  #     input = gets.strip.downcase
  #     case input
  #     when "back"
      #   puts ""
      #   puts ""

      #   posters_menu(input)

      #   puts ""
      #   puts ""
      # when "home"
      #   puts ""
      #   puts ""

      #   collections_menu

      #   puts ""
      #   puts ""

      # when "exit"
      #   puts ""
      #   see_you_later
      #   puts ""
      # else 
      #   puts ""
      #   puts ""
      #   puts "I can't do that. Please, try again."
      #   puts ""
      #   puts ""
      #   puts ""
  #     end
  #   end
  # end

  def print_posters (posters)
    posters.each_with_index do |poster, index| 
      puts "#{index+1}. #{poster.title.capitalize}" 
      puts "https://digitalcollections.nypl.org#{poster.url}"
      end
  end

  def see_you_later
    puts ""
    puts "Thanks for stopping by. Comeback soon."
  end

    
end