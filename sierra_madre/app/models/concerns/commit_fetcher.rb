require 'open-uri'
class CommitFetcher
  attr_reader :commit_url, :commit

  def initialize(commit_url)
    @commit_url = commit_url
    @commit = get_commit
  end

  def files
    @commit["files"].select { |f| /\.raml$/ =~ f["filename"] }
  end

  def file(filename)
    selected(filename)
  end

  def raw_url(filename)
    selected(filename)["raw_url"]
  end

  def raw_file(filename)
    open(selected(filename)["raw_url"]).read
  end

  private
    def get_commit
      auth = { 
        username: Rails.application.secrets["github_username"], 
        password: Rails.application.secrets["github_password"] 
      }
      response = HTTParty.get @commit_url, basic_auth: auth
      JSON.parse response.body
    end

    def selected(filename)
      select_result = @commit["files"].select { |f| f["filename"].include?(filename) }
      select_result.first
    end
end