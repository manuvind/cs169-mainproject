require 'spec_helper'

describe "rotations/show" do
  before(:each) do
    @rotation = assign(:rotation, stub_model(Rotation))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
