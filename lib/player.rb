class Player
    attr_accessor :name 
    attr_reader :sym
    def initialize(name,sym)
        @name = name
        @sym = sym
    end
end