require 'spec_helper'

describe "shifts/show" do
  before(:each) do
    @shift = assign(:shift, stub_model(Shift,
      :title => "Title",
      :description => "Description",
      :event => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(//)
  end
end
