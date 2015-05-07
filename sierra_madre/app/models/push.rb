class Push
  attr_accessor :payload

  def initialize(json = nil)
    @payload = JSON.parse(json)
  end

  def has_raml?
    head_commit = @payload["head_commit"]
    commit_list = [head_commit["added"], head_commit["modified"]].flatten.compact
    raml_matches = commit_list.grep /\.raml$/
    raml_matches.empty? ? false : raml_matches
  end
end