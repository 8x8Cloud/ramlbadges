require 'rails_helper'

RSpec.describe Push do
  let(:raml_payload) { JSON.parse(File.read(Rails.root.join("spec/fixtures/raml_payload.json"))) }
  let(:raml_payload_as_params) { ActionController::Parameters.new(raml_payload)}
  let(:sample_payload) { JSON.parse(File.read(Rails.root.join("spec/fixtures/sample_github_payload.json"))) }
  let(:sample_payload_as_params) { ActionController::Parameters.new(sample_payload)}

  it "creates a new Push with Github even payload" do
    push = Push.new(raml_payload_as_params)
    expect(push).to be_instance_of Push
  end

  it "returns a Repository object" do
    push = Push.new(raml_payload_as_params)
    expect(push.repository).to be_instance_of Repository
  end

  context "contains RAML files" do
    let(:push) { Push.new(raml_payload_as_params) }

    it "#has_raml_files? returns true" do
      expect(push.has_raml_files?).to be_truthy
    end

    it "returns a Commit object" do
      push = Push.new(raml_payload_as_params)
      expect(push.commit).to be_instance_of Commit
    end
  end

  context "doesn't contain RAML files" do
    let(:push) { Push.new(sample_payload_as_params) }

    it "#has_raml_files? returns false" do
      expect(push.has_raml_files?).to be_falsy
    end

    it "does not return a Commit object" do
      expect(push.commit).to eq(nil)
    end
  end

  context "when no Repositories match" do
    let(:push) { Push.new(raml_payload_as_params) }

    it "returns a new Repository" do
      expect(push.repository.created_at).to eq(push.repository.updated_at)
    end
  end

  context "when a Repository matches" do
    let(:push) { Push.new(raml_payload_as_params) }

    before :all do
      @repo = FactoryGirl.create(:raml_repository)
    end

    it "returns the matching Repository" do
      expect(push.repository.github_id).to eq(@repo.github_id)
    end
  end
end