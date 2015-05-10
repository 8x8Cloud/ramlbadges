require 'rails_helper'

RSpec.describe Commit, type: :model do
  let(:commit) { Commit.create }
  
  it "returns a CommitFetcher" do
    expect(commit.fetched_commit).to be_instance_of CommitFetcher
  end
end
