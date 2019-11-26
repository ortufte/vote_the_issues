class VoteTheIssues::Candidate

    attr_accessor :name, :candidate_url, :candidate_issues, :views

    @@candidates = [ ]

    def initialize
        @@candidates << self 
    end

    def self.all
        VoteTheIssues::Scraper.scrape_candidates
        @@candidates
    end

    def issues(candidate)
         VoteTheIssues::Scraper.scrape_candidate_issues(candidate.candidate_url)
    end

    def views(candidate)
         VoteTheIssues::Scraper.scrape_candidate_views(candidate.candidate_url)
    end

end
