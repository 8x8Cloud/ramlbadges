class CommitController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
  end

  def create
    @repository = 
      Repository.where(github_id: params[:repository][:id]).first || 
        Repository.create(repository_attributes)

    params[:commits].each do |commit|
      added = commit[:added]
      removed = commit[:removed]
      modified = commit[:modified]

      all_changes = [added, removed, modified]
      all_changes = all_changes.compact.reduce([], :|)

      raml_matches = all_changes.grep(/\.raml$/)

      unless raml_matches.empty?
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
        url: params[:repository][:url]
      }
    end
end
