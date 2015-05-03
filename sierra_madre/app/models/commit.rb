class Commit < ActiveRecord::Base
  belongs_to :repository

  def fetch_github_commit
    
  end
end
