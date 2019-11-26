1. flow
2. classes (Candidate, Issue, Scraper, CLI)
    a. class relationships

program flow

Welcome message, user chooses whether to select a candidate or an issue
Gets User Input

    IF USER WANTS TO SELECT A SPECIFIC CANDIDATE
    scrape list of candidates (that are currently in the race))
    puts out list of candidates 
    asks user to select a candidate number
    receives input and puts out a list of issues to select from
    asks user to select an issue 
    receives input and puts out the candidates view on the selected issue

    IF USER WANTS TO SELECT AN ISSUE
    scrape list of issues - (from where?) 
    puts out list of issues - issues.each_with_index {|issue, index| puts "#{index+1}: #{issue}”}
    asks user to select an issue 
    receives input and puts out all candidates stances on the issue
   
   
    