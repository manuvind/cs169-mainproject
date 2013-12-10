require 'spec_helper'

describe AppointmentsController do

  describe "GET 'availability'" do
    it "returns http success" do
      get :availability
      response.should be_success
    end
  end

  it "should find a shift given a unique id and set available to true" do
  	shift = FactoryGirl.create(:shift)
  	shift.stub(:available)
  	shift.stub_chain(:rotation, :event, :users, :each)
  	ShiftNotifier.stub_chain(:coordinator_notify, :deliver)
  	Shift.stub(:find_by_uniq_id).and_return(shift)
  	Shift.should_receive(:find_by_uniq_id)
  	get :availability, {:uniq_id => 4, :available => 'true'}
  end

  it "should set available to false" do
  	shift = FactoryGirl.create(:shift)
  	shift.stub(:available)
  	shift.stub_chain(:rotation, :event, :users, :each)
  	Shift.stub(:find_by_uniq_id).and_return(shift)
  	shift.should_receive(:available)
  	get :availability, {:uniq_id => 4, :available => 'false'}
  end
end
