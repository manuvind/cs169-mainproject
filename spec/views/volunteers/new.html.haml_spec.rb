require 'spec_helper'

describe "volunteers/new" do
  before(:each) do
    assign(:volunteer, stub_model(Volunteer,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new volunteer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", volunteers_path, "post" do
      assert_select "input#volunteer_name[name=?]", "volunteer[name]"
      assert_select "input#volunteer_email[name=?]", "volunteer[email]"
      assert_select "input#volunteer_phone[name=?]", "volunteer[phone]"
    end
  end
end
