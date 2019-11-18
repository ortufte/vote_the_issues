class Issue
    attr_accessor :name 

    @@issues = [ ]

    def initialize(name)
        @name = name
        @@issues << self 
    end
