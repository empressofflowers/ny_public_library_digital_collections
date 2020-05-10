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
  end

### Need to fix my loop. It won't exit from home once you've been in different menus, but when you return home from the posters menu, you can select a new collection and view those posters.

  def collections_menu(input=nil)

    puts ""
    puts "~~~~~~~~~~~~~Poster Collections~~~~~~~~~~~~~~~"
    puts ""

    NYPLDC::Collections.print_collections

    puts ""
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "|HOME| |'exit'|"
    puts ""
    puts "Enter the number of the collection you would like to view or 'exit':"
    puts ""
    puts ""

    input = gets.strip
    while input != 'exit'
      case input 
      when ("1".."21")
        puts ""
        posters_menu(NYPLDC::Collections.all[input.to_i-1])
      end

      if input == "exit"
        puts "Thanks for stopping by. Comeback soon." 
        break
        #The message doens't display, but it exits, and only when you haven't alerady viewed a list of posters. If you have,it displays the exit message(?) then gives you the poster menu for the most recent collection of posters.
      end
    end
  end

  ### After the you select a collection, you should move on to the next method, that displays a list of letters that you cen enter to view that posters that begin with that letter. If it's empty, nothing should return.

  def posters_menu(current_collection)
    NYPLDC::Scraper.scrape_posters(current_collection)
    #current_collection_posters = current_collection.posters

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
    puts "|'home'| |#{current_collection.name.upcase}| |'exit'|"
    puts ""
    puts "Enter a letter to view."
    puts ""
    puts ""

    input = gets.strip.downcase
    while input != "exit"
      case input
      when ("a".."z")   
        puts ""
        posters_list(NYPLDC::Posters.find_by_first_letter(input)) 
      when "home"
        puts ""
        puts ""

        collections_menu

        puts ""
        puts ""
      when input == 'exit'
        break
      end
    end
  end

  def posters_list(current_posters)
    puts ""
    puts ""
    puts ""

    NYPLDC::Posters.sprint_posters

    puts ""
    puts ""
    puts "|'home'| |#{current_collection.name.upcase}|  |'exit'|"
    puts ""
    puts "Enter a letter to view a new list."
    puts ""

    input = gets.strip
    while input != 'exit'
      case input 
      when ("1".."21")
        puts ""
        posters_menu(NYPLDC::Collections.all[input.to_i-1])
      end

      if input == "exit"
        puts "Thanks for stopping by. Comeback soon." 
        break
      end
    end

  end
end