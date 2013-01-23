require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :account => "Account",
        :name => "Name",
        :hashed_password => "Hashed Password",
        :salt => "Salt",
        :role_id => 1
      ),
      stub_model(User,
        :account => "Account",
        :name => "Name",
        :hashed_password => "Hashed Password",
        :salt => "Salt",
        :role_id => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Hashed Password".to_s, :count => 2
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
