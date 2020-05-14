

class NYPLDC::Poster
  attr_accessor :title, :link, :collection

  @@all = []

  def initialize title=nil, link=nil
    @link = link
    @title = title
    @collection = collection
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_posters_with_index
    @@all.each_with_index do |poster, index| poster.collection == self
      puts "#{index+1}. #{poster.title.upcase}" 
      puts "https://digitalcollections.nypl.org#{poster.link}"
    end
  end
  

  #poster.title = name of an instance of a poster
  #poster.collection = the collection a poster belongs to
  #Poster.all = all of the posters
  #poster.url = link to a specific poster
  #Poster.find_by_first_letter = find the poster by the first letter of it's title
  #Poster.new = new by url or it's title
end