require 'spec_helper'

describe "rotations/index" do
  before(:each) do
    assign(:rotations, [
      stub_model(Rotation),
      stub_model(Rotation)
    ])
  end

  it "renders a list of rotations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
