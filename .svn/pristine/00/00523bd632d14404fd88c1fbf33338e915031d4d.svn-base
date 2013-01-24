require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :paper_title => "MyString",
      :stage => "MyString",
      :status => "MyString",
      :current_achievement => "MyText",
      :student_id => 1,
      :project_type => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_paper_title", :name => "project[paper_title]"
      assert_select "input#project_stage", :name => "project[stage]"
      assert_select "input#project_status", :name => "project[status]"
      assert_select "textarea#project_current_achievement", :name => "project[current_achievement]"
      assert_select "input#project_student_id", :name => "project[student_id]"
      assert_select "input#project_project_type", :name => "project[project_type]"
    end
  end
end
