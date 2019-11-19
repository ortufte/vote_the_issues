require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    
    def self.scrape_main_page(url)
        candidates = [ ] #candidates for candidate list
        issues = [ ] #issues for issue list
        candidate_urls = [ ] #candidate_urls
        issue_urls = [ ] #candidate_urls 
        
        doc = Nokogiri::HTML(open(url))
        
        #candidates for candidate list
        names = doc.css(".border-container")
        candidate.name = names.each do |name|
            name.css("img").attr("alt").to_s.sub(" 2020 election candidate", "")
            candidates << candidate.name
        end

        #issues for issue list
        topics = doc.css(".issues-list li")
        issue = topics.each do |topic|
            issue.name = topic.css("a").text
            issues << issue.name
        end

        #candidate_urls to operate on in candidate viewpoint method - will need to add BASE_PATH before
        candidate_heads = doc.css(".candidate-head")
        candidate_heads.each do |candidate_head|
            candidate_data = candidate_head.css("a").attr("data-tip")
            data = JSON.parse(candidate_data)
            candidate.profile_url = data["slug"]
            candidate_urls << candidate.profile_url
        end

        #issue_urls to operate on in issue viewpoints method
        issue_headers = doc.css(".issues-list li")
        issue_headers.each do |issue_header|
            issue_url = issue_header.css("a").attr("href")
            issue_urls << issue_url
        end

    end

    def scrape_candidate_page(profile_url)

        candidate.issues = [ ] #candidate issues to list after candidate chosen 
        candidate.views = [ ] #candidate views to display after a view is chosen && after issue chosen from main 
        
        doc = Nokogiri::HTML(open(profile_url))

        things = doc.css(".position-name")
        
        things.each do |thing|
        candidate_issue = thing.css(".issue-name").text
        candidate.issues << candidate_issue
        end

        things.each do |thing|
        candidate_stance = thing.css(".position-stance-name").text
        candidate.views << candidate_stance
        end
    end

    def scrape_issue_page(issue_url)
        doc = Nokogiri::HTML(open(issue_url))

        issue.candidates = [ ] #issue candidates to list after issue chosen

        candidates = doc.css(".border-container")
        candidates.each do |candidate|
            issue_candidate = thing.css("img").attr("alt").to_s.sub(" 2020 election candidate", "")
            issue.candidates << issue_candidate
            end
    end

