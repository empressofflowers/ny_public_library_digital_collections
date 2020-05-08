# My Controller.
require 'pry'

class NyPublicLibraryDigitalCollections::CLI

    def call
        # A new instance of the NyPublicLibraryDigitalCollections:
        puts "Welcome to the New York Public Library: Digital Collections"
        puts ""
        collections_menu
    end

    def collections_menu
        input = nil
        while input != "exit"
            puts "~~~~~WORK~~~~~~~"
            puts "Collection 1"
            puts "Collection 2"
            puts "Collection 3"
            puts "Collection 4"
            puts "~~~~~~~~~~~~"
            puts ""
            puts "Enter the number of the collection you would like to view or 'exit':"
            puts ""
            input = gets.strip.downcase
            case input 
            when ("1".."4")
                puts ""
                posters_menu
            else
                puts ""
                puts ""
                puts "I can't do that."
                puts ""
                puts ""
                puts ""
                collections_menu
            end
        end
        
    end

    
    def posters_menu
        input = nil
        while input != "exit"
            puts "Name of the Collection"
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
            input = gets.strip.downcase
            case input
            when ("a".."z")
                #I think I'll need to create an alphabet range, that contains an array of
                #all of the posters that start with that letter, within the instance of that collection.
                puts ""
                puts ""
                print_posters_menu
            when "back"
                puts ""
                puts ""
                puts collections_menu
            else 
                puts ""
                puts ""
                puts "I can't do that."
                puts ""
                puts ""
                puts ""
                posters_menu
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
    
    def see_you_later
        puts ""
        puts "Thanks for stopping by. Comeback soon."
    end
end