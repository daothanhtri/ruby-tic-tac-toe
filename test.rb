class Animals
    class << self 
        include Skin 
        def type
            puts "This is animal"
        end
    end
end

module Skin 
    def color
        puts "White"
    end
end