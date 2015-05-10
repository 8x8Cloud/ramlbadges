require 'rails_helper'

RSpec.describe Commit, type: :model do
  let(:commit) { FactoryGirl.create(:commit) }
  
  it "returns a CommitFetcher" do
    expect(commit.fetched_commit).to be_instance_of CommitFetcher
  end

  it "returns a Github API url" do
    test_api_url = "https://api.github.com/repos/baxterthehacker/commits/0d1a26e67d8f5eaf1f6ba5c57fc3c7d91ac0fd1c"
    expect(commit.api_url).to eq test_api_url
  end
end
