require 'rails_helper'

RSpec.describe Repository do
  it "is an instance of Repository" do
    push = Repository.new
    expect(push).to be_instance_of Repository
  end
end