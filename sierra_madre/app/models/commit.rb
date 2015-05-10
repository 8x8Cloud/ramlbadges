class Commit < ActiveRecord::Base
  belongs_to :repository

  def fetched_commit
    CommitFetcher.new(self.api_url)
  end

  def api_url
    "https://api.github.com/repos/#{self.repository.owner}/commits/#{sha}"
  end
end
