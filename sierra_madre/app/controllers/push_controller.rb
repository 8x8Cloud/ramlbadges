class PushController < ApplicationController
  def create
    @push = Push.new(params[:push])
  end
end
