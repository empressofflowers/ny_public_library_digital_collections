

class NyPublicLibraryDigitalCollections::Poster
  attr_accessor :title, :url, :collection

  @@all = []

  def initialize title=nil, url=nil, collection=nil
    @url = url
    @title = title
    @collection = collection
  end

  def self.all
    @@all
  end

  def self.find_by_first_letter

  end


  #poster.title = name of the poster
  #poster.image = print to terminal the photo
  #Poster.collection = all of the posters in an instance of a collection
  #Poster.all = all of the posters
  #poster.url = link to a specific poster
  #Poster.find_by_first_letter = find the poster by the first letter of it's title
  #Poster.new = new by url or it's title

end