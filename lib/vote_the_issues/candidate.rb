class VoteTheIssues::Candidate

    attr_accessor :name, :candidate_url, :issues, :views

    @@candidates = [ ]

    def initialize
        @@candidates << self 
    end

    def self.all
        if @@candidates.empty?
            VoteTheIssues::Scraper.scrape_candidates
            @@candidates
        else
            @@candidates
        end
    end

    def issues(candidate)
         VoteTheIssues::Scraper.scrape_candidate_issues(candidate.candidate_url)
    end

    def views(candidate)
         VoteTheIssues::Scraper.scrape_candidate_views(candidate.candidate_url)
    end

end
