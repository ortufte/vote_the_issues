class VoteTheIssues::CLI
   
    def call
        puts "\nWelcome to Vote the Issues!\n"
        puts "\nIf you would like to see a specific candidate's stance on a particular issue, enter 'candidates':\n"
        puts "\nOR\n"
        puts "\nIf you would like to see how all the candidate's views compare on a particular issue, enter 'issues':\n"
        follow_user_preference
    end

    def follow_user_preference
        user_preference = gets.strip
        if user_preference == 'candidates' 
            get_candidates
            view_candidates
            get_issues
            view_candidate_issues
            get_candidate_viewpoint
        elsif user_preference == 'issues'
            get_issues
            view_issues
            view_issue
        elsif 
            user_preference == 'exit'
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

    def get_candidates
        @candidates = [1, 2, 3, 4]
    end

    def view_candidates
        puts "\nPlease select a candidate by number:\n"
        @candidates.each_with_index {|candidate, index| puts "#{index+1}: #{candidate}"}
    end

    def get_issues
        @issues = [1, 2, 3, 4]
    end

    def view_candidate_issues
        until valid_input(@candidates)
            invalid_entry
            view_candidates
        end
            view_issues
    end

    def view_issues
        puts "\nPlease select an issue by number:\n"
        @issues.each.with_index(1) {|issue, index| puts "#{index}: #{issue}"}
    end
    
    def get_candidate_viewpoint
        until valid_input(@issues) 
            invalid_entry
            view_issues
        end
        puts "candidate viewpoint here"

        puts "\n To see another candidate's stance on a particular issue, enter 'candidates':\n"
        puts "\n To see where all the candidates stand on a particular issue, enter 'issues':\n"
        puts "\n Enter 'exit' to exit:\n"

        follow_user_preference

            #Candidate.issues each do |candidate_issue|
                #if @issues[user_input-1] == candidate_issue
                    #puts "{#Candidate.issues[user_input-1]}"
                #else
                    #puts "This candidate has no offical view on this issue yet."
                #end
    end

    def view_issue
        until valid_input(@issues)
            invalid_entry
            view_issues
        end
        issue_viewpoints
    end

    def issue_viewpoints
        #puts "Here are where all candidates stand on this #{issue}:"

        #VoteTheIssues::Candidate.all.each do |candidate|
            #puts "#{Candidate.name}:"
            #Candidate.issues each do |candidate_issue|
            #if @issues[user_input-1] == candidate_issue
                #puts "{#Candidate.issues[user_input-1]}"
            #else
                #puts "This candidate has no offical view on this issue yet."
            #end
        #end
        puts "issue viewpoints"

        puts "\n To select another issue, enter 'issues':\n"
        puts "\n To view a specific candidate's view on a specific issue, enter 'candidates':\n"
        puts "\n Enter 'exit' to exit:\n"

        follow_user_preference

    end

end