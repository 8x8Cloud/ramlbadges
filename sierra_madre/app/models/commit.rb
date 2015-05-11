class Commit < ActiveRecord::Base
  belongs_to :repository

  def fetched_commit
    CommitFetcher.new(self.api_url)
  end

  def files
    self.fetched_commit.files
  end

  def raw_url(filename)
    self.fetched_commit.raw_url(filename)
  end

  def raw_file(filename)
    self.fetched_commit.raw_file(filename)
  end

  def api_url
    "https://api.github.com/repos/#{self.repository.owner}/#{self.repository.name}/commits/#{sha}"
  end
end
