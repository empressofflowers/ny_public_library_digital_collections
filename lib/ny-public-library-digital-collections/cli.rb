# My Controller.
require 'pry'

class NyPublicLibraryDigitalCollections::CLI

  def call
    NyPublicLibraryDigitalCollections::Scraper.scrape_collections
    puts ""
    puts ""
    puts "Welcome to the New York Public Library: Digital Collections"
    puts ""
    collections_menu
  end

  def collections_menu
    puts ""
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""

    NyPublicLibraryDigitalCollections::Collection.all.each_with_index {|collection, index| puts "#{index+1}. #{collection.name}"}

    puts ""
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "Enter the number of the collection you would like to view or 'exit':"
    puts ""

    input = gets.strip

    case input 
    when ("1".."21")
      puts ""
      #capture collection and pass to posters menu
      posters_menu(input)
      #find this collection instance and pass to posters
    else
      puts ""
      puts ""
      puts "I can't do that."
      puts ""
      puts ""
      puts ""
    end
  end

    def posters_menu(input)
      puts ""
      puts "Enter a letter to view it's posters."
      puts ""
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "A - B - C - D -E - F - G - I -J - K - L - M - N" 
      puts ""
      puts "O - P - Q - R - S - T - U - V - W - X - Y - Z"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts ""
      puts ""
      puts "|back| |/name of collection/| |exit|"
      puts ""

      current_collection = NyPublicLibraryDigitalCollections::Collection.find(input.to_i)
      NyPublicLibraryDigitalCollections::Scraper.scrape_posters(current_collection)
      current_collection_posters = current_collection.posters

      input = nil
      while input != "exit"


      input = gets.strip.downcase
      case input
      when ("a".."z")
        def find_by_first_letter(posters, input)
          posters.select {|poster| poster.title.downcase.start_with?(input)}
        end
        posters_by_letter = find_by_first_letter(current_collection_posters, input)
          
        #binding.pry
          #I think I'll need to create an alphabet range, that contains an array of
          #all of the posters that start with that letter, within the instance of that collection.
          puts ""
          puts ""
          print_posters(posters_by_letter)
      else 
          puts ""
          puts ""
          puts "I can't do that."
          puts ""
          puts ""
          puts ""
      end

    end
    end

    def print_menu
        input = nil
        while input != "exit"
            puts "@~*~@~*~@~*~@~*~@~*~@~*~@~*~@~*~@"
            puts "This is a poster with citations." 
            puts "@~*~@~*~@~*~@~*~@~*~@~*~@~*~@~*~@"
            puts ""
            puts "@~*~@~*~@~*~@~*~@~*~@~*~@~*~@~*~@"
            puts "This is a poster with citations." 
            puts "@~*~@~*~@~*~@~*~@~*~@~*~@~*~@~*~@"
            puts ""
            puts "@~*~@~*~@~*~@~*~@~*~@~*~@~*~@~*~@"
            puts "This is a poster with citations." 
            puts "@~*~@~*~@~*~@~*~@~*~@~*~@~*~@~*~@"
            puts ""
            puts "|<| |/name of collection/| |>|"
            puts "|back| |collections| |exit|"
            puts ""
            input = gets.strip.downcase
            case input
            when "<"
                puts ""
                puts "Previous Poster"
                print_menu
            when ">"
                puts ""
                puts "Next Poster"
                print_menu
            when "collections"
                puts ""
                collections_menu
            when "back"
                puts ""
                posters_menu
            else
                puts ""
                puts ""
                puts "I can't do that."
                puts ""
                puts ""
                puts ""
                print_menu
            end
        end
    end

    def print_posters (posters)
      posters.each {|poster| puts "#{poster.title}" 
                                  puts "https://digitalcollections.nypl.org#{poster.url}"}
    end

    def see_you_later
        puts ""
        puts "Thanks for stopping by. Comeback soon."
    end
end