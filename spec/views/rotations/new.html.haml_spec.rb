require 'spec_helper'

describe "rotations/new" do
  before(:each) do
    assign(:rotation, stub_model(Rotation).as_new_record)
  end

  it "renders new rotation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rotations_path, "post" do
    end
  end
end
