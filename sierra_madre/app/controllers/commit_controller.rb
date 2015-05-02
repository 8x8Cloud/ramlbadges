class CommitController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
  end

  def create
    logger.debug params[:repository][:id]
  end

  def update
  end

  def destroy
  end
end
