class Craml
  def initialize
  end

  def payload(json_response)
    @jason_response = json_response
  end

  def to_s
    "I'll CRAML-ize ya!"
  end
end