
require 'pry'
class NYPLDC::Controller

  def welcome
    puts ""
    puts ""
    puts ">> Welcome to the New York Public Library: Digital Collections <<"
    puts ""
  end

  def display_collection_and_posters
    puts "~~~~~~~~~~~~~~~~~~~~~Poster Collections~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    NYPLDC::Collection.all.each_with_index do |collection, index|
      puts "#{index+1}.#{collection.name.upcase}: #{collection.quantity}"
    end
    puts ""
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts ""
    puts "Enter the number of the collection you would like to view:"
    puts ""
    puts ""

    input = gets.chomp.to_i
    if (1..21).include?(input)
      puts ""
      puts ""
      NYPLDC::Scraper.scrape_posters(input) # <---- Getting bad gateway 502 errors depending on which collection I'm scraping.
      NYPLDC::Poster.all.each_with_index do |poster, index| poster.collection == self
        puts "#{index+1}. #{poster.title.upcase}" 
        puts "https://digitalcollections.nypl.org#{poster.link}"
      end    
    else
      puts ""
      puts "Please try again."
      display_collection_and_posters
    end
  end

  # I would like to always display what collection you're in and display them 10 at a time with an option to go to the next set.
  # I would love to figure out the loops to make proper menus, but this all works!

  def prompt_to_view_poster_or_exit
    puts ""
    puts ""
    puts "To view a poster, hold command and click the link or 'exit'."
    puts ""

    input = gets.chomp.downcase
    if "exit"
      puts ""
      see_you_later
    else 
      puts ""
      puts "Please try again."
      prompt_to_view_poster_or_exit
    end
  end

  def see_you_later
    puts "Thank you. Come again."
  end

  def run
    NYPLDC::Scraper.scrape_collections
    welcome
    display_collection_and_posters
    prompt_to_view_poster_or_exit
  end
end