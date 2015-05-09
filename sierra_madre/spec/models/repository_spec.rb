require 'rails_helper'

RSpec.describe Repository, type: :model do
  let(:repository) { FactoryGirl.create :raml_repository }

  it "creates a Repository object" do
    expect(repository).to be_instance_of Repository
  end
end
