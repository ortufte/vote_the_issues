class Candidate

    attr_accessor :name

    @@candidates = [ ]

    def initialize(name, url)
        @name = name
        @url = url
        @@candidates << self 
    end

end
