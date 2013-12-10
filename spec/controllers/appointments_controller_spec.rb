require 'spec_helper'

describe AppointmentsController do

  describe "GET 'availability'" do
    it "returns http success" do
      get 'availability'
      response.should be_success
    end
  end

end
