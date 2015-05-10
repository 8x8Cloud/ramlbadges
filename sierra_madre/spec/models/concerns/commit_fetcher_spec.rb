require 'rails_helper'
require 'webmock'

RSpec.describe CommitFetcher, type: :model do
  let(:commit) { FactoryGirl.create(:commit) }
  let(:commit_payload) { File.read(Rails.root.join("spec/fixtures/commit_payload.json")) }

  it "is an instance of CommitFetcher" do
    commit_fetcher = CommitFetcher.new(commit.api_url)
    expect(commit_fetcher).to be_instance_of CommitFetcher
  end

  it "has the correct commit url" do
    commit_fetcher = CommitFetcher.new(commit.api_url)
    test_api_url = "https://api.github.com/repos/baxterthehacker/public-repo/commits/0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c"
    expect(commit_fetcher.commit_url).to eq(test_api_url)
  end

  context "when successfully fetching a commit from Github" do
    let(:commit_fetcher) { CommitFetcher.new(commit.api_url) }
    let(:test_payload) { JSON.parse(commit_payload) }
    let(:test_files) { test_payload["files"] }
    let(:test_file) { test_files[0] }

    it "gets a commit from Github" do
      expect(commit_fetcher.commit).to eq test_payload
    end

    it "returns array of file hashes from commit" do
      expect(commit_fetcher.files).to eq test_files
    end

    it "returns a file hash when given a filename" do
      expect(commit_fetcher.file(test_file["name"])).to eq test_file
    end

    it "returns a raw file when given a filename" do
      test_raw_file = File.open('spec/fixtures/test_raml.raml', 'r').read
      expect(commit_fetcher.raw_file(test_file["name"])).to eq test_raw_file
    end
  end
end
