require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  describe "GET #index" do
    let(:commit) { FactoryGirl.create(:raml_repository) }

    it "has a status code of 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the #index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns a list of commits" do
      get :index
      expect(assigns(:commits)).not_to be_nil
    end
  end

  describe "GET #show" do
    let(:commit) { FactoryGirl.create(:commit) }

    it "has a status code of 200" do
      get :show, id: commit.id
      expect(response.status).to eq(200)
    end
    it "renders the #show template" do
      get :show, id: commit.id
      expect(response).to render_template("show")
    end
    it "assigns a commit" do
      get :show, id: commit.id
      expect(assigns(:commit)).not_to be_nil
    end
    it "assigns the correct commit" do
      get :show, id: commit.id
      expect(assigns(:commit)).to eq(commit)
    end
  end
end
