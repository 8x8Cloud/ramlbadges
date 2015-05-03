class CommitController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    @commit = Commit.find params[:id]
    @commit.fetch_github_commit
    @ramls = @commit.find_raml_files
  end

  def create
    @repository = 
      Repository.where(github_id: params[:repository][:id]).first || 
        Repository.create(repository_attributes)

    params[:commits].each do |commit|
      if raml_matches?(commit)
        @commit = Commit.create(repository: @repository, commit_sha: commit[:id])
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def repository_attributes
      { 
        github_id: params[:repository][:id],
        name: params[:repository][:name],
        url: params[:repository][:url],
        owner_name: params[:repository][:owner][:name]
      }
    end

  private
    def raml_matches?(commit)
      all_changes = [commit[:added], commit[:removed], commit[:modified]].compact.reduce([], :|)
      all_changes.grep(/\.raml$/)
    end
end
