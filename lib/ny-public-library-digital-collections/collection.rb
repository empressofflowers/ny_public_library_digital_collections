### The Single Source of Truth

class NYPLDC::Collection
  attr_accessor :name, :quantity, :link, :posters

  # Don't have the time right now to figure out how to refactor this with the concerns.

  # include Concerns::InstanceMethod
  # extend Concerns::ClassMethod

  @@all = []

  def initialize attr_hash
    attr_hash.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end

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

end