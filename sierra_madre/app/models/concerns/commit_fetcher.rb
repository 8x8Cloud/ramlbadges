require 'open-uri'
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
    selected(filename)
  end

  def raw_file(filename)
    open(selected(filename)["raw_url"]).read
  end

  private
    def get_commit
      response = HTTParty.get @commit_url
      JSON.parse response.body
    end

    def selected(filename)
      select_result = @commit["files"].select { |f| f["name"] == filename }
      select_result.first
    end
end