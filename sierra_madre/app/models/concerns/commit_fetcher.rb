class CommitFetcher
  attr_reader :commit_url, :commit

  def initialize(commit_url)
    @commit_url = commit_url
    @commit = get_commit
  end

  def files
    @commit["files"]
  end

  def file(filename)
    selected = @commit["files"].select { |f| f["name"] == filename }
    selected.first
  end

  # def raw_file(filename)
    
  # end

  private
    def get_commit
      response = HTTParty.get @commit_url
      JSON.parse response.body
    end
end