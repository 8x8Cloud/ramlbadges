class PushController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @push = Push.new(params)
  end
end
