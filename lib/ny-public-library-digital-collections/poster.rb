

class NyPublicLibraryDigitalCollections::Poster
  attr_accessor :title, :url, :collection

  @@all = []

  def initialize title=nil, url=nil, collection=nil
    @url = url
    @title = title
    @collection = collection
    @@all << self
  end

  def self.all
    @@all
  end

  #def find_by_first_letter(current_collection_posters)
  #  current_collection_posters.select {|poster| poster.name.downcase.start_with?(letter)}
  #end
    

  #poster.title = name of the poster
  #poster.image = print to terminal the photo
  #Poster.collection = all of the posters in an instance of a collection
  #Poster.all = all of the posters
  #poster.url = link to a specific poster
  #Poster.find_by_first_letter = find the poster by the first letter of it's title
  #Poster.new = new by url or it's title

end