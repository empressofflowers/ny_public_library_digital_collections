# My Controller.

class NyPublicLibraryDigitalCollections::CLI

    def call
        puts "Welcome to the New York Public Library: Digital Collections"
        list_collections
        collections_menu
        print_poster
        poster_menu
        thanks_for_stopping_by
    end 

    def list_collections
        puts "1. Poster Collection..."
        #shows a list of the collections.
        puts "Please enter the number of the collection you would like to view or type exit to go:"

    end

    def collections_menu
        puts "Please enter the number of the collection you would like to view or type exit to go:"
        #allows user to select the collection to view by number or exit.
        input = nil
        while input != "exit"
            input = gets.strip.downcase 
            case input
            when "1"
                puts "First Collection"
            when "2"
                puts "Second Collection"
            when "exit"
                thanks_for_stopping_by
            end
        end
    end

    def print_poster
        #prints to screen image of the poster plus citations.
        puts "This is a poster."
    end
    
    def poster_menu #can this be refactored?
        #allows user to enter < or > to cycle through images, home to return to main page, back to return to collection list or exit.
        #if I can't figure out how to print to terminal, I'll provide a link to view in browser.
        puts "Enter '<' to go back '>' to go forward or type 'exit' to go:"
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "<"
                puts "Previous Poster"
            when ">"
                puts "Next Poster"
            when "exit"
                thanks_for_stopping_by
            end
        end
    end

    def thanks_for_stopping_by
        puts "Thanks for stopping by. Come back soon."
    end
end