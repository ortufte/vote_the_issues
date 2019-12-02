class VoteTheIssues::Candidate

    attr_accessor :name, :candidate_url

    @@candidates = [ ]

    def initialize
        @@candidates << self
        @issues = [ ]
        @views = [ ]
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
        if @issues.empty?
             @issues = VoteTheIssues::Scraper.scrape_candidate_issues(candidate.candidate_url)
        else
            @issues
        end
    end

    def views(candidate)
        if @views.empty?
            @views = VoteTheIssues::Scraper.scrape_candidate_views(candidate.candidate_url)
        else
            @views
        end
    end

end
