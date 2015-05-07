require 'rails_helper'

RSpec.describe Push do
  let(:sample_payload) { File.read(Rails.root.join("spec/fixtures/sample_github_payload.json")) }
  let(:raml_payload) { File.read(Rails.root.join("spec/fixtures/raml_payload.json")) }

  it "is an instance of Push" do
    push = Push.new(sample_payload)
    expect(push).to be_instance_of Push
  end

  it "returns a Github webhook JSON payload" do
    push = Push.new(sample_payload)
    expect(push.payload).to eq(JSON.parse(sample_payload))
  end

  it "contains a RAML file in the head commit" do
    push = Push.new(raml_payload)
    expect(push).to have_raml
  end
end