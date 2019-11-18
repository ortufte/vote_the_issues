require_relative "./vote_the_issues/version"
require_relative "./vote_the_issues/cli"
require_relative "./vote_the_issues/candidate"
require_relative "./vote_the_issues/issue"
require_relative "./vote_the_issues/scraper"

require "pry"

module VoteTheIssues
  class Error < StandardError; end
  # Your code goes here...
end
