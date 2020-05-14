### The Single Source of Truth

class NYPLDC::Collection
  attr_accessor :name, :quantity, :link, :posters

  include Concerns::InstanceMethod
  extend Concerns::ClassMethod

  @@all = []
  
  #Want to make sure I'm extending/including the concerns correctly.

  # def initialize attr_hash
  #   info.each {|key, value| self.send("#{key}=", value)}
  #   @@all << self
  # end

  # def self.all
  #   @@all
  # end

  def posters
    NYPLDC::Poster.all.select {|poster| poster.collection == self}
  end

  def self.find(id)
    @@all.find(id)
  end

  def self.print_collections_with_index
    @@all.each_with_index {|collection, index|
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