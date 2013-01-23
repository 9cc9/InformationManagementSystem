require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :account => "Account",
      :name => "Name",
      :hashed_password => "Hashed Password",
      :salt => "Salt",
      :role_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account/)
    rendered.should match(/Name/)
    rendered.should match(/Hashed Password/)
    rendered.should match(/Salt/)
    rendered.should match(/1/)
  end
end
