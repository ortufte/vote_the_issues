class VoteTheIssues::CLI #namespacing 
   
    def call
        puts "\nWelcome to Vote the Issues!\n"
        puts "\nIf you would like to see a specific candidate's stance on a particular issue, enter 'candidate':\n"
        puts "\nOR\n"
        puts "\nIf you would like to see how the the candidate's views compare on a particular issue, enter 'issues':\n"
        follow_user_preference
    end

    def follow_user_preference
        user_preference = gets.strip
        if user_preference == 'candidate' 
            get_candidates
            view_candidates
            get_candidate_issues
            view_candidate_issues
            get_candidate_viewpoint
        elsif user_preference == 'issues'
            get_issues
            view_issues
            view_issue
        elsif 
            user_prefrence == 'exit'
            exit
        else
            invalid_entry
            follow_user_preference
        end
    end

    def valid_input(array)
        user_input = gets.strip.to_i
        user_input <= array.length && user_input > 0 
    end

    def invalid_entry
        puts puts "\nInvalid entry, please try again.\n"
    end

#####################################################################################################################

    def get_candidates
        @candidates = ["a", "b", "c"] #will be scraped
    end

    def view_candidates
        puts "\nPlease select a candidate by number:\n"
        @candidates.each.with_index(1) {|candidate, index| puts "#{index}: #{candidate}"}
    end

    def get_candidate_issues
        @candidate_issues = ["x", "y", "z"] #will be scraped
    end

    def valid_input(array)
        user_input = gets.strip.to_i
        user_input <= array.length && user_input > 0 
    end

    def view_candidate_issues
        if valid_input(@candidates)
            puts "\nPlease select an issue by number:\n"
        #VoteTheIssues::Candidate.all.each.with_index(1) do |candidate|
        #@candidate_issues.each.with_index(1) {|issue, index| puts "#{index}: #{issue}"}
        else 
            invalid_entry
            view_candidate_issues
        end
    end

    def get_candidate_viewpoint
        if valid_input(@candidate_issues) 
            candidate_viewpoint 
        else 
            invalid_entry
            view_candidate_issues
        end
        
    end


    def candidate_viewpoint
        "test" #will be scraped
    end

############################################################################################
    

    def get_issues
        @issues = ["1", "2", "3"] #will be scraped
    end

    def view_issues
        puts "\nPlease select an issue by number:\n"
        @issues.each.with_index(1) {|issue, index| puts "#{index}: #{issue}"}
    end

    def view_issue
        if valid_input(@issues)
            issue_viewpoints
        else
            invalid_entry
            view_issues
        end
    end

    def issue_viewpoints
        #VoteTheIssues::Issue.all.each.with_index(1) do |issue|
        #   puts issue.name
        #   puts issue.viewpoints
        #puts "The following candidates share this viewpoint"
        #puts candidates who share that viewpoint
    end
end
