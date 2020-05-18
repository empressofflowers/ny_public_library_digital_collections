### The Single Source of Truth

class NYPLDC::Collection
  attr_accessor :name, :quantity, :link, :posters

  # Don't have the time right now to figure out how to refactor this with the concerns.

  # include Concerns::InstanceMethod
  # extend Concerns::ClassMethod

  @@all = []

  def initialize attr_hash
    attr_hash.each {|attribute, value| self.send("#{attribute}=", value)}
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

end