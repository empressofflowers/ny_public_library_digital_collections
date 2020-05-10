

class NYPLDC::Collection
  attr_accessor :name, :quantity, :url

  @@all = []
  
  def initialize name, quantity, url
    @name = name
    @quantity = quantity
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all[id-1]
  end

  def posters
    NYPLDC::Poster.all.find_all {|poster| poster.collection == self.name}
  end

#binding.pry 

  # collection.name = name of the collection
  # Collection.all = all of the collections
  # Collection.new= creates a new instance of a collection by name or url
  # Collection.find = find a collection by it's id
  # collection.url = link to the collection
  # I need a method that prints to the terminal each Collection name with it's number
    #it might be a hash key pair of k = number, v = name.




end