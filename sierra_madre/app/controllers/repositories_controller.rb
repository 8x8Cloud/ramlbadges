class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.includes(:commits).all
  end

  def show
    @repository = Repository.find params[:id]
  end
end
