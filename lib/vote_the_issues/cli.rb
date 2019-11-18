class VoteTheIssues::CLI #namespacing 
   
    def call
        puts " "
        puts "Welcome to Vote the Issues!"
        puts " "
        puts "If you would like to see a specific candidate's stance on a particular issue, enter 'candidate':"
        puts "OR"
        puts "If you would like to see how the the candidate's views compare on a particular issue, enter 'issues':"
        puts " "
        get_user_preference
    end

    def get_user_preference
        user_selection = gets.strip
        if user_selection == 'candidate' 
            get_candidates
            view_candidates
        elsif user_selection == 'issues'
            get_issues
            view_issues
        else 
            puts "Invalid entry, please try again."
        end
    end

    def get_candidates
        @candidates = ["a", "b", "c"] #will be scraped
    end

    def view_candidates
        @candidates.each.with_index(1) {|candidate, index| puts "#{index}: #{candidate}"}
        puts " "
        puts "Please select a candidate by number:"
    end

    def get_candidate_issues
        @candidate_issues = [ ]

    end

    def view_candidate_issues
        @candidate_issues.each.with_index(1) do |issue, index| 
            puts "#{index}: #{issue}"
        end
        puts " "
        puts "Please select an issue by number:"
    end

    def get_issues
        @issues = ["1", "2", "3"] #will be scraped
    end

    def view_issues
        @issues.each.with_index(1) do |issue, index| 
            puts "#{index}: #{issue}"
        end
        puts " "
        puts "Please select an issue by number:"
    end

    def view_issue
        #for each issue

    end

    def issue_viewpoints
        #for each issue
        #puts issue name
        #puts viewpoints
        #puts "The following candidates share this viewpoint"
        #puts candidates who share that viewpoint
    end
end
