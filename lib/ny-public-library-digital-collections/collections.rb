

class NYPLDC::Collections
  attr_accessor :name, :quantity, :url, :posters

  @@all = []
  
  def initialize name, quantity, url
    @name = name
    @quantity = quantity
    @url = url
    @posters = []
    @@all << self
  end

  def posters
    NYPLDC::Posters.select {|poster| poster.collection = self}
  end

  def add_poster
   new_poster = NYPLDC::Posters.new(title, url)
   posters << new_poster
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all[id-1]
  end

  def self.print_collections
    @@all.map {|collection, index| puts "#{index}.#{collection.name.upcase},-#{collection.quantity}"}
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