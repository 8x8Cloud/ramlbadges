require 'rails_helper'

RSpec.describe PushController, type: :controller do

  describe "POST #create" do
    let(:raml_payload) { File.read(Rails.root.join("spec/fixtures/raml_payload.json")) }

    it "returns http success" do
      post :create, push: raml_payload
      expect(response).to have_http_status(:success)
    end

    it "receives Github event payload" do
      post :create, push: raml_payload
      expect(assigns(:push)).to be_instance_of(Push)
    end
  end

end
