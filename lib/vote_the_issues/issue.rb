class VoteTheIssues::Issue

    attr_accessor :name

    @@issues = [ ]

    def initialize
        @@issues << self 
    end

    def self.all
        if @@issues.empty?
            VoteTheIssues::Scraper.scrape_issues
            @@issues
        else
            @@issues
        end
    end

end
