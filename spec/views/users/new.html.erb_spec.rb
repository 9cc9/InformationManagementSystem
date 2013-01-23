require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :account => "MyString",
      :name => "MyString",
      :hashed_password => "MyString",
      :salt => "MyString",
      :role_id => 1
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_account", :name => "user[account]"
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_hashed_password", :name => "user[hashed_password]"
      assert_select "input#user_salt", :name => "user[salt]"
      assert_select "input#user_role_id", :name => "user[role_id]"
    end
  end
end
