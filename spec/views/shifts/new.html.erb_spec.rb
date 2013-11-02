require 'spec_helper'

describe "shifts/new" do
  before(:each) do
    assign(:shift, stub_model(Shift,
      :title => "MyString",
      :description => "MyString",
      :event => nil
    ).as_new_record)
  end

  it "renders new shift form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shifts_path, "post" do
      assert_select "input#shift_title[name=?]", "shift[title]"
      assert_select "input#shift_description[name=?]", "shift[description]"
      assert_select "input#shift_event[name=?]", "shift[event]"
    end
  end
end
