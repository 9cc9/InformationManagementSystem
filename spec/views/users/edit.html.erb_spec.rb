require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :account => "MyString",
      :name => "MyString",
      :hashed_password => "MyString",
      :salt => "MyString",
      :role_id => 1
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_account", :name => "user[account]"
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_hashed_password", :name => "user[hashed_password]"
      assert_select "input#user_salt", :name => "user[salt]"
      assert_select "input#user_role_id", :name => "user[role_id]"
    end
  end
end