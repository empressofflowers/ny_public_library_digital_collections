
module Concerns

  module Concerns::InstanceMethod
    def initialize info
      info.each {|key, value| self.send("#{key}=", value)}
    end
  end

  module Concerns::ClassMethod
    def self.all
      @@all
    end

    def self.save
      @@all << self
    end
  end
end

