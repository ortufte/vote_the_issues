class VoteTheIssues::Scraper

    def self.scrape_candidates #DONE

        doc = Nokogiri::HTML(open("https://www.politico.com/2020-election/candidates-views-on-the-issues/"))

        candidate_heads = doc.css(".candidate-head")
        
        candidate_heads.each do |candidate_head|
            candidate_data = candidate_head.css("a").attr("data-tip")
            data = JSON.parse(candidate_data)
            candidate_object = VoteTheIssues::Candidate.new
            candidate_object.name = data["full_name"]
            candidate_object.candidate_url = data["slug"]
        end

    end


    def self.scrape_candidate_issues(candidate_url) #DONE

        doc = Nokogiri::HTML(open("https://www.politico.com/2020-election/candidates-views-on-the-issues/#{candidate_url}"))
    
        @issues = [ ]
        things = doc.css(".issue-name")
                
        things.each do |thing|     
            @issues << thing.text
        end

        @issues
        
    end

    def self.scrape_candidate_views(candidate_url)

        doc = Nokogiri::HTML(open("https://www.politico.com/2020-election/candidates-views-on-the-issues/#{candidate_url}"))
    
        @views = [ ]
        things = doc.css(".position-stance-name")
        
        things.each do |thing|
            @views << thing.text
        end

        @views

    end

    def self.scrape_issues #DONE

        doc = Nokogiri::HTML(open("https://www.politico.com/2020-election/candidates-views-on-the-issues/"))

        topics = doc.css(".issues-list li")
        
        topic = topics.each do |topic|
            issue = VoteTheIssues::Issue.new
            issue.name = topic.css("a").text
        end
    
    end

end
