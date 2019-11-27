class VoteTheIssues::CLI
   
    def call
        puts "\nWelcome to Vote the Issues!\n".black.on_blue
        main_menu
    end

    def main_menu
        puts "\nIf you would like to see a specific candidate's view on a particular issue, enter 'candidates':".colorize(:red)
        puts "\nIf you would like to see how all of the candidate's views compare on one particular issue, enter 'issues':\n"
        puts "\nIf you would like to exit, enter 'exit':\n".colorize(:blue)
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

    def valid_input(array)
        @user_input = gets.strip.to_i
        @user_input <= array.length && @user_input > 0 
    end

    def invalid_entry 
        puts puts "\nInvalid entry, please try again.\n"
    end

    def get_candidates 
        @candidates = VoteTheIssues::Candidate.all
    end

    def view_candidates 
        puts "\nPlease select a candidate by number:\n".colorize(:blue)
        @candidates.each_with_index {|candidate, index| puts "#{index+1}: #{candidate.name}"}
    end

    def get_issues 
        @issues = VoteTheIssues::Issue.all
    end

    def get_candidate_issues 
        until valid_input(@candidates)
            invalid_entry
        end
        @candidate = @candidates[@user_input-1]
        @candidate_issues = @candidate.issues(@candidate)
    end

    def view_candidate_issues #DONE
        puts "\nPlease select an issue by number:\n".colorize(:blue)
        @candidate_issues.each_with_index {|issue, index| puts "#{index+1}: #{issue}"} 
    end

    def view_issues #DONE
        puts "\nPlease select an issue by number:\n".colorize(:blue)
        @issues.each_with_index {|issue, index| puts "#{index+1}: #{issue.name}"}
    end
    
    def get_candidate_viewpoint #DONE
        until valid_input(@candidate_issues)	
            invalid_entry  
        end
            viewpoints = @candidate.views(@candidate)
            puts ""
            puts ""
            puts "#{@candidate.name}'s current view on #{@candidate_issues[@user_input-1]} is:".colorize(:red)
            puts ""
            puts "#{viewpoints[@user_input-1]}"
            puts ""
            puts ""
            main_menu
    end

    def issue_viewpoints 
        until valid_input(@issues)
            invalid_entry
        end
            selection = VoteTheIssues::Issue.all[@user_input-1]
            puts "\nHere are where each of the candidates stand on #{selection.name}:\n".colorize(:red)
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
        main_menu
    end
  
end
