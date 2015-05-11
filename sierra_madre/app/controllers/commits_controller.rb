class CommitsController < ApplicationController
  def index
    @commits = Commit.all
  end

  def show
    @commit = Commit.find params[:id]
  end

  def raw_file
    @commit = Commit.find params[:commit_id]
    respond_to do |format|
      format.html { render layout: "raw_file" }
    end
  end
end
