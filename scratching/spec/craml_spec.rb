require 'spec_helper'

describe Craml do
  it "returns instance of Craml" do
    craml = Craml.new
    expect(craml).to be_instance_of Craml
  end
end