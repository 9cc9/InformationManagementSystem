require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :name => "Name",
        :school_number => "School Number",
        :major => "Major",
        :phone_number => "Phone Number",
        :email => "Email",
        :doctor_type => "Doctor Type",
        :teacher_name => "Teacher Name",
        :academy => "Academy",
        :is_graduated => false
      ),
      stub_model(Student,
        :name => "Name",
        :school_number => "School Number",
        :major => "Major",
        :phone_number => "Phone Number",
        :email => "Email",
        :doctor_type => "Doctor Type",
        :teacher_name => "Teacher Name",
        :academy => "Academy",
        :is_graduated => false
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "School Number".to_s, :count => 2
    assert_select "tr>td", :text => "Major".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Doctor Type".to_s, :count => 2
    assert_select "tr>td", :text => "Teacher Name".to_s, :count => 2
    assert_select "tr>td", :text => "Academy".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
