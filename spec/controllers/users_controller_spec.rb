require 'spec_helper'

describe UsersController do

  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RotationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  def login_user(user)
    sign_in user
  end
  before (:each) do
    login_user(FactoryGirl.create(:admin))
    @event = FactoryGirl.create(:event)
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
