require 'httparty'

class CommitFetcher
  attr_reader :sha

  def initialize(sha)
    @sha = sha
  end

  def github_fetch

  end
end