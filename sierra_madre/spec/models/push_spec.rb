require 'rails_helper'

RSpec.describe Push do
  let(:raml_payload) { File.read(Rails.root.join("spec/fixtures/raml_payload.json")) }

  it "creates a new Push with Github even payload" do
    push = Push.new(raml_payload)
    expect(push).to be_instance_of Push
  end

  it "builds a Repository object" do
    push = Push.new(raml_payload)
    expect(push.repository).to be_instance_of Repository
  end
end