require 'rails_helper'

RSpec.describe Push do
  let(:raml_payload) { File.read(Rails.root.join("spec/fixtures/raml_payload.json")) }
end