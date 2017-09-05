require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#index action" do 
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#new action" do 
    it "should successfully show the page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "game#create action" do
    it "should successfully create a new game in our database" do
      post :create, params: { game: { name: 'Hello' } }
      expect(response).to redirect_to game_path

      game = Game.last
      expect(game.name).to eq("Hello")
    end
  end
end
