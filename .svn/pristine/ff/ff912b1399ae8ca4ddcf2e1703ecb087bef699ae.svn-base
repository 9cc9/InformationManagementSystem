require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :paper_title => "Paper Title",
        :stage => "Stage",
        :status => "Status",
        :current_achievement => "MyText",
        :student_id => 1,
        :project_type => "Project Type"
      ),
      stub_model(Project,
        :paper_title => "Paper Title",
        :stage => "Stage",
        :status => "Status",
        :current_achievement => "MyText",
        :student_id => 1,
        :project_type => "Project Type"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Paper Title".to_s, :count => 2
    assert_select "tr>td", :text => "Stage".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Project Type".to_s, :count => 2
  end
end
