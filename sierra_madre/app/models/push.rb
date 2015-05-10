class Push
  attr_reader :payload, :repository, :commit

  def initialize(payload)
    @payload = JSON.parse(payload)
    @repository = Repository.where(repository_attributes).first_or_create
    @commit = Commit.create(commit_attributes) if has_raml_files?
  end

  def has_raml_files?
    !files_array.grep(/\.raml$/i).empty?
  end

  private
    def repository_attributes
      {
        name: repo["name"],
        github_id: repo["id"]
      }
    end

    def commit_attributes
      {
        sha: head_commit["id"],
        message: head_commit["message"],
        timestamp: head_commit["timestamp"],
        url: head_commit["url"],
        repository: @repository
      }
    end

    def files_array
      [head_commit["added"], head_commit["modified"]].flatten.compact
    end

    def head_commit
      @payload["head_commit"]
    end

    def repo
      @payload["repository"]
    end
end