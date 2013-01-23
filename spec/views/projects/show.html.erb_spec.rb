require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :paper_title => "Paper Title",
      :stage => "Stage",
      :status => "Status",
      :current_achievement => "MyText",
      :student_id => 1,
      :project_type => "Project Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Paper Title/)
    rendered.should match(/Stage/)
    rendered.should match(/Status/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Project Type/)
  end
end
