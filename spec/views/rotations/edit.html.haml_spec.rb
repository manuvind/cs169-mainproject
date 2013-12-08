require 'spec_helper'

describe "rotations/edit" do
  before(:each) do
    @rotation = assign(:rotation, stub_model(Rotation))
  end

  it "renders the edit rotation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rotation_path(@rotation), "post" do
    end
  end
end
