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
            get_candidate_issues
            view_candidate_issues
            get_candidate_viewpoint
        elsif user_preference == 'issues'
            get_issues
            view_issues
            issue_viewpoints
        elsif 
            user_preference == 'exit'
            exit
        else
            invalid_entry
            follow_user_preference
        end
    end

    def valid_input(user_input, array)
        user_input <= array.length && user_input > 0 
    end

    def invalid_entry #DONE
        puts puts "\nInvalid entry, please try again.\n"
    end

    def get_candidates #DONE
        @candidates = VoteTheIssues::Candidate.all
    end

    def view_candidates #DONE
        puts "\nPlease select a candidate by number:\n"
        @candidates.each_with_index {|candidate, index| puts "#{index+1}: #{candidate.name}"}
    end

    def get_issues #DONE
        @issues = VoteTheIssues::Issue.all
    end

    def get_candidate_issues #NEED VALID INPUT METHOD
        user_input = gets.strip.to_i
        candidate = @candidates[user_input]
        @candidate_issues = candidate.issues(@candidate)
    end

    def view_candidate_issues #DONE
        puts "\nPlease select an issue by number:\n"
        @candidate_issues.each_with_index {|issue, index| puts "#{index+1}: #{issue}"}
    end

    def view_issues #DONE
        puts "\nPlease select an issue by number:\n"
        @issues.each.with_index(1) {|issue, index| puts "#{index}: #{issue.name}"}
    end
    
    def get_candidate_viewpoint #NEED VALID INPUT METHOD
        issue = gets.strip.to_i
        viewpoints = @candidate.views(@candidate)
        puts "#{@candidate.name}'s current view on #{@candidate_issues[issue]} is:"
        puts ""
        puts "#{viewpoints[issue]}"

        puts "\n To see another candidate's stance on a particular issue, enter 'candidates':\n"
        puts "\n To see where all the candidates stand on a particular issue, enter 'issues':\n"
        puts "\n Enter 'exit' to exit:\n"

        follow_user_preference
    end

    def issue_viewpoints #DONE
        user_input = gets.strip.to_i
        selection = VoteTheIssues::Issue.all[user_input-1]
        puts "\nHere are where each of the candidates stand on #{selection.name}:\n"
        puts " "

        VoteTheIssues::Candidate.all.each do |candidate|
            puts "#{candidate.name}:"
            candidate_issues = candidate.issues(candidate)
            if candidate_issues.include?(selection.name)
                index = candidate_issues.rindex(selection.name) 
                puts "#{candidate.views(candidate)[index]}\n"
                puts " "
            else
                puts "This candidate has no offical view on this issue yet.\n"
                puts " "
            end
        end

        puts "\n To select another issue, enter 'issues':\n"
        puts "\n To view a specific candidate's view on a specific issue, enter 'candidates':\n"
        puts "\n Enter 'exit' to exit:\n"

        follow_user_preference
    end

end

