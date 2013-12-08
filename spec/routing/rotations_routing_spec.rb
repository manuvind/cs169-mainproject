require "spec_helper"

describe RotationsController do
  describe "routing" do

    it "routes to #index" do
      get("/rotations").should route_to("rotations#index")
    end

    it "routes to #new" do
      get("/rotations/new").should route_to("rotations#new")
    end

    it "routes to #show" do
      get("/rotations/1").should route_to("rotations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rotations/1/edit").should route_to("rotations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rotations").should route_to("rotations#create")
    end

    it "routes to #update" do
      put("/rotations/1").should route_to("rotations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rotations/1").should route_to("rotations#destroy", :id => "1")
    end

  end
end
