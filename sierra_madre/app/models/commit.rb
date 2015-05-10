class Commit < ActiveRecord::Base
  belongs_to :repository

  def fetched_commit
    CommitFetcher.new(self.sha)
  end
end
