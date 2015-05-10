require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  describe "GET #index" do
    let(:repositories) { [FactoryGirl.create(:raml_repository)] }

    it "has a status code of 200" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the #index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns a list of repositories" do
      get :index
      expect(assigns(:repositories)).not_to be_nil
    end
  end

  describe "GET #show" do
    let(:repository) { FactoryGirl.create(:raml_repository) }

    it "has a status code of 200" do
      get :show, id: repository.id
      expect(response.status).to eq(200)
    end
    it "renders the #show template" do
      get :show, id: repository.id
      expect(response).to render_template("show")
    end
    it "assigns a repository" do
      get :show, id: repository.id
      expect(assigns(:repository)).not_to be_nil
    end
    it "assigns the correct repository" do
      get :show, id: repository.id
      expect(assigns(:repository)).to eq(repository)
    end
  end
end
