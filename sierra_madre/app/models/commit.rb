class Commit < ActiveRecord::Base
  belongs_to :repository

  default_scope { order(updated_at: :desc) }

  def fetch_github_commit
    @repo = self.repository
    commit_url = "https://api.github.com/repos/#{@repo.owner_name}/#{@repo.name}/commits/#{self.commit_sha}"
    response = HTTParty.get commit_url
    @commit_body = JSON.parse response.body
  end

  def find_raml_files
    files = @commit_body['files']
    ramls = []
    files.each do |file|
      matches = /\.raml$/.match(file['filename'])
      if matches
        ramls << file
      end
    end
    ramls
  end
end
