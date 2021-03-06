require 'rails_helper'

#here we describe the subject of the spec, WelcomeController
RSpec.describe WelcomeController, type: :controller do
  describe "GET index" do
    it "renders the index template" do

      #here we use get to call the index method of WelcomeController
      get :index

      #here we expect the controllers response to render the index template
      expect(response).to render_template("index")
    end
  end

  describe "GET about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

end
