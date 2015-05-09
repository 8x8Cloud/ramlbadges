require 'rails_helper'

RSpec.describe Push do
  let(:raml_payload) { File.read(Rails.root.join("spec/fixtures/raml_payload.json")) }

  it "creates a new Push with Github even payload" do
    push = Push.new(raml_payload)
    expect(push).to be_instance_of Push
  end

  it "returns a Repository object" do
    push = Push.new(raml_payload)
    expect(push.repository).to be_instance_of Repository
  end

  context "when no Repositories match" do
    let(:push) { Push.new(raml_payload) }

    it "returns a new Repository" do
      expect(push.repository.created_at).to eq(push.repository.updated_at)
    end
  end

  context "when a Repository matches" do
    let(:push) { Push.new(raml_payload) }

    before :all do
      @repo = FactoryGirl.create(:raml_repository)
    end

    it "returns the matching Repository" do
      expect(push.repository.github_id).to eq(@repo.github_id)
    end
  end
end