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
    @user = FactoryGirl.create(:admin)
    login_user(@user)
    @event = FactoryGirl.create(:event)
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      User.stub(:new).and_return(@user)
      @user.stub(:save).and_return(true)
      get 'create'
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      User.stub(:find)
      get 'edit', {:id => 1}
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      User.stub_chain(:find, :destroy)
      get 'destroy', {:id => 1}
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', {:id => 1}
    end
  end

end
