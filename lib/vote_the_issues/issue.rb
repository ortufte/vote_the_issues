class VoteTheIssues::Issue

    attr_accessor :name

    @@issues = [ ]

    def initialize
        @@issues << self 
    end

    def self.all
        VoteTheIssues::Scraper.scrape_issues
        @@issues
    end

end
