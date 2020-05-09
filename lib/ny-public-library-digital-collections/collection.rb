

class NyPublicLibraryDigitalCollections::Collection
  attr_accessor :name, :quantity, :url

  @@all = []

  def initialize name=nil, quantity=nil, url=nil
    @name = name
    @quantity = quantity
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new name, quantity, url
    Collection.new(name, quantity, url)
  end

  def self.find(id)
    @@all.find[id-1]
  end

  def self.print_all
    print @@all
  end

  # collection.name = name of the collection
  # Collection.all = all of the collections
  # Collection.new= creates a new instance of a collection by name or url
  # Collection.find_by_name = find a collection by it's name
  # collection.url = link to the collection
  # I need a method that prints to the terminal each Collection name with it's number
    #it might be a hash key pair of k = number, v = name.




end