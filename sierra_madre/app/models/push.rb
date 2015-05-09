class Push
  attr_accessor :payload

  attr_reader :repository

  def initialize(json = nil)
    @payload = JSON.parse(json)
  end

  def repository
    @repository ||= @payload["repository"]
  end

  def has_raml?
    raml_matches = commit_list.grep /\.raml$/
    raml_matches.empty? ? false : raml_matches
  end

  private
    def commit_list
      head_commit = @payload["head_commit"]
      [head_commit["added"], head_commit["modified"]].flatten.compact
    end
end