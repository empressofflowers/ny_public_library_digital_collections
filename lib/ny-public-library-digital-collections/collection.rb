### The Single Source of Truth

class NYPLDC::Collection
  attr_accessor :name, :quantity, :link, :posters

  @@collections = []
  
  def initialize name, quantity, link
    @name = name
    @quantity = quantity
    @link = link
    @@collections << self
  end

  def self.all
    @@collections
  end

  def posters
    NYPLDC::Poster.all.select {|poster| poster.collection == self}
  end

  def self.find(id)
    @@collections.find(id)
  end

  def self.print_collections_with_index
    @@collections.each_with_index {|collection, index|
      puts "#{index+1}.#{collection.name.upcase}: #{collection.quantity}"}
  end

#binding.pry 

  # collection.name = name of the collection
  # collection.posters = posters that belong to an instance of a collection
  # Collection.new = a new instance of a collection
  # Collection.all = all of the collections
  # Collection.find = find a collection by it's id
  # collection.url = link to the collection
  # Collection.print = prints to terminal a collection
end