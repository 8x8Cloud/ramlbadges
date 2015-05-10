class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.includes(:commits).all
  end
end
