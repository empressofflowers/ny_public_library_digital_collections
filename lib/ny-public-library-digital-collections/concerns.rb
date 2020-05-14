
module Concerns

  module Concerns::InstanceMethod
    def initialize info
      info.each {|key, value| self.send("#{key}=", value)}
      @@all << self
    end
  end

  module Concerns::ClassMethod
    def self.all
      @@all
    end
  end
end

