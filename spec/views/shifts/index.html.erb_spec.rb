require 'spec_helper'

describe "shifts/index" do
  before(:each) do
    assign(:shifts, [
      stub_model(Shift,
        :title => "Title",
        :description => "Description",
        :event => nil
      ),
      stub_model(Shift,
        :title => "Title",
        :description => "Description",
        :event => nil
      )
    ])
  end

  it "renders a list of shifts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
