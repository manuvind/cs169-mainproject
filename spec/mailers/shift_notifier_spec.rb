require "spec_helper"

describe ShiftNotifier do
  # it "should call shift_notify" do
  # 	shift = FactoryGirl.create(:shift)
  # 	volunteer = FactoryGirl.create(:volunteer)
  # 	shift.stub(:volunteer).and_return(volunteer)
  # 	shift.should_receive(:volunteer)
  # 	ShiftNotifier.shift_notify(shift)
  # end

  it "should call coordinator_notify" do
  	user = FactoryGirl.create(:user)
  	shift = FactoryGirl.create(:shift)
  	volunteer = FactoryGirl.create(:volunteer)
  	shift.stub(:volunteer).and_return(volunteer)
  	ShiftNotifier.coordinator_notify(user, shift, true)
  end
end
