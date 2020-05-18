

class NYPLDC::Poster
  attr_accessor :title, :link, :collection
  
  # Don't have the time right now to figure out how to refactor this witht he concerns.

  # include Concerns::InstanceMethod
  # extend Concerns::ClassMethod

  def title= title
    @title = title
  end

  def title
    @title
  end

  @@all = []

  def initialize attr_hash # <--- Forgot to add mass assignment here. Still only returns up to 50 posts.
    attr_hash.each {|attribute, value| self.send("#{attribute}=", value)}
    @@all << self
  end

  def self.all
    @@all
  end

end