class Push
  attr_reader :payload, :repository

  def initialize(payload)
    @payload = JSON.parse(payload)
    @repository = Repository.new
  end
end