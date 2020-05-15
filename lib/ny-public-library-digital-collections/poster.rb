

class NYPLDC::Poster
  attr_accessor :title, :link, :collection
  
  # Don't have the time right now to figure out how to refactor this witht he concerns.

  # include Concerns::InstanceMethod
  # extend Concerns::ClassMethod

  @@all = []

  def initialize attr_hash # <--- Forgot to add mass assignment here. Still only returns up to 50 posts.
    attr_hash.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_posters_with_index
    @@all.each_with_index do |poster, index| poster.collection == self
      puts "#{index+1}. #{poster.title.upcase}" # <----- After adding mass assingment in this class, it recognizes the key, value pairs.
      puts "https://digitalcollections.nypl.org#{poster.link}"
    end
  end
end