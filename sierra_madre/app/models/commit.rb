class Commit < ActiveRecord::Base
  belongs_to :repository

  def fetched_commit
    CommitFetcher.new(self.api_url)
  end

  def files
    self.fetched_commit.files
  end

  def api_url
    "https://api.github.com/repos/#{self.repository.owner}/#{self.repository.name}/commits/#{sha}"
  end
end
