require 'spec_helper'

describe "shifts/edit" do
  before(:each) do
    @shift = assign(:shift, stub_model(Shift,
      :title => "MyString",
      :description => "MyString",
      :event => nil
    ))
  end

  it "renders the edit shift form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shift_path(@shift), "post" do
      assert_select "input#shift_title[name=?]", "shift[title]"
      assert_select "input#shift_description[name=?]", "shift[description]"
      assert_select "input#shift_event[name=?]", "shift[event]"
    end
  end
end
