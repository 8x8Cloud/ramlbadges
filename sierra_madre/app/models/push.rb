class Push
  attr_reader :payload, :repository

  def initialize(payload)
    @payload = JSON.parse(payload)
    @repository = Repository.where(repository_attributes).first_or_create
  end

  private
    def repository_attributes
      repo = @payload["repository"]

      {
        name: repo["name"],
        github_id: repo["id"]
      }
    end
end