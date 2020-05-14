
module Concerns

  module Concerns::InstanceMethod
    def initialize attr_hash
      attr_hash.each {|key, value| self.send("#{key}=", value)}
    end
  end

  module Concerns::ClassMethod
    def self.all
      @@all
    end
  end
end

