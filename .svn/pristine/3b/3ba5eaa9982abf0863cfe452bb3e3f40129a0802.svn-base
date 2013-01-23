require 'spec_helper'

describe "students/new" do
  before(:each) do
    assign(:student, stub_model(Student,
      :name => "MyString",
      :school_number => "MyString",
      :major => "MyString",
      :phone_number => "MyString",
      :email => "MyString",
      :doctor_type => "MyString",
      :teacher_name => "MyString",
      :academy => "MyString",
      :is_graduated => false
    ).as_new_record)
  end

  it "renders new student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path, :method => "post" do
      assert_select "input#student_name", :name => "student[name]"
      assert_select "input#student_school_number", :name => "student[school_number]"
      assert_select "input#student_major", :name => "student[major]"
      assert_select "input#student_phone_number", :name => "student[phone_number]"
      assert_select "input#student_email", :name => "student[email]"
      assert_select "input#student_doctor_type", :name => "student[doctor_type]"
      assert_select "input#student_teacher_name", :name => "student[teacher_name]"
      assert_select "input#student_academy", :name => "student[academy]"
      assert_select "input#student_is_graduated", :name => "student[is_graduated]"
    end
  end
end
