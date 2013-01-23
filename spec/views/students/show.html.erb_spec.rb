require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :name => "Name",
      :school_number => "School Number",
      :major => "Major",
      :phone_number => "Phone Number",
      :email => "Email",
      :doctor_type => "Doctor Type",
      :teacher_name => "Teacher Name",
      :academy => "Academy",
      :is_graduated => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/School Number/)
    rendered.should match(/Major/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Email/)
    rendered.should match(/Doctor Type/)
    rendered.should match(/Teacher Name/)
    rendered.should match(/Academy/)
    rendered.should match(/false/)
  end
end
