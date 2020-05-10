

class NYPLDC::Posters
  attr_accessor :title, :url, :collection

  @@all = []

  def initialize title=nil, url=nil
    @url = url
    @title = title
    @@all << self
    save
  end

  def self.all
    @@all
  end

  def save
    self.collection
  end

  def collection
    NYPLDC::Collections.select {|collection| collection.poster = self}
  end

  def self.find_by_first_letter(input)
    self.collection.select {|poster| poster.name.start_with?(input-1)}
  end
    
  def self.print_posters(poster)
    self.all.find_by_first_letter.each_with_index do |poster, index| 
      puts "#{index+1}. #{poster.title.upcase}" 
      puts "https://digitalcollections.nypl.org#{poster.url}"
    end
  end

  #poster.title = name of the poster
  #poster.image = print to terminal the photo
  #Poster.collection = all of the posters in an instance of a collection
  #Poster.all = all of the posters
  #poster.url = link to a specific poster
  #Poster.find_by_first_letter = find the poster by the first letter of it's title
  #Poster.new = new by url or it's title
end