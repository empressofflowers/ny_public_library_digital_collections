
module Concerns

  module Concerns::InstanceMethods
    def initialize info
      info.each {|key, value| self.send("#{key}=", value)}
      @@all << self
    end
  end

  module Concerns::ClassMethods
    def self.all
      @@all
    end
  end
end

