# encoding: utf-8
require 'spec_helper'


describe ProjectsController do

  before do
    controller.stub(:authorize).and_return()
  end
  #
  ## This should return the minimal set of attributes required to create a valid
  ## Project. As you add validations to Project, be sure to
  ## update the return value of this method accordingly.
  #def valid_attributes
  #  {"paper_title" => "MyString"}
  #end
  #
  ## This should return the minimal set of values that should be in the session
  ## in order to pass any filters (e.g. authentication) defined in
  ## ProjectsController. Be sure to keep this updated too.
  #def valid_session
  #  {}
  #end
  #
  #describe "GET index" do
  #  it "assigns all projects as @projects" do
  #    project = Project.create! valid_attributes
  #    get :index, {}, valid_session
  #    assigns(:projects).should eq([project])
  #  end
  #end
  #
  #describe "GET show" do
  #  it "assigns the requested project as @project" do
  #    project = Project.create! valid_attributes
  #    get :show, {:id => project.to_param}, valid_session
  #    assigns(:project).should eq(project)
  #  end
  #end
  #
  #describe "GET new" do
  #  it "assigns a new project as @project" do
  #    get :new, {}, valid_session
  #    assigns(:project).should be_a_new(Project)
  #  end
  #end
  #
  #describe "GET edit" do
  #  it "assigns the requested project as @project" do
  #    project = Project.create! valid_attributes
  #    get :edit, {:id => project.to_param}, valid_session
  #    assigns(:project).should eq(project)
  #  end
  #end
  #
  #describe "POST create" do
  #  describe "with valid params" do
  #    it "creates a new Project" do
  #      expect {
  #        post :create, {:project => valid_attributes}, valid_session
  #      }.to change(Project, :count).by(1)
  #    end
  #
  #    it "assigns a newly created project as @project" do
  #      post :create, {:project => valid_attributes}, valid_session
  #      assigns(:project).should be_a(Project)
  #      assigns(:project).should be_persisted
  #    end
  #
  #    it "redirects to the created project" do
  #      post :create, {:project => valid_attributes}, valid_session
  #      response.should redirect_to(Project.last)
  #    end
  #  end
  #
  #  describe "with invalid params" do
  #    it "assigns a newly created but unsaved project as @project" do
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Project.any_instance.stub(:save).and_return(false)
  #      post :create, {:project => {"paper_title" => "invalid value"}}, valid_session
  #      assigns(:project).should be_a_new(Project)
  #    end
  #
  #    it "re-renders the 'new' template" do
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Project.any_instance.stub(:save).and_return(false)
  #      post :create, {:project => {"paper_title" => "invalid value"}}, valid_session
  #      response.should render_template("new")
  #    end
  #  end
  #end
  #
  #
  #describe "DELETE destroy" do
  #  it "destroys the requested project" do
  #    project = Project.create! valid_attributes
  #    expect {
  #      delete :destroy, {:id => project.to_param}, valid_session
  #    }.to change(Project, :count).by(-1)
  #  end
  #
  #  it "redirects to the projects list" do
  #    project = Project.create! valid_attributes
  #    delete :destroy, {:id => project.to_param}, valid_session
  #    response.should redirect_to(projects_url)
  #  end
  #end


  describe "process search" do
    # 检查参数是否为空
    describe "check params" do
      context "all params are nil" do
        let(:params) { {"student_name" => "", "established" => {"at" => ""},
                        "project_type" => "-", "academy_type" => "-"} }
        it "should get checked_params hash" do
          controller.check_params_nil(params).first.should == {"student_name" => "",
                                                               "established_at" => false,
                                                               "project_type" => "%%",
                                                               "academy_type" => ""}
        end

        it "generate sql condition for nil params" do
          controller.generate_sql_condition({"student_name" => "",
                                             "established_at" => false,
                                             "project_type" => "%%",
                                             "academy_type" => ""}, false).should == ["project_type LIKE ?", "%%"]
        end
      end

      context "params include project_type、academy_type and student_name  is nil" do
        let(:params) { {"student_name" => "", "established" => {"at" => "01/07/2013"},
                        "project_type" => "-", "academy_type" => "-"} }
        it "should get checked_params hash" do
          controller.check_params_nil(params).first.should == {"student_name" => "",
                                                               "established_at" => DateTime.parse("01/07/2013"),
                                                               "project_type" => "%%",
                                                               "academy_type" => ""}
        end
        it "generate sql condition for project_type、academy_type and student_name  is nil" do
          controller.generate_sql_condition({"student_name" => "",
                                             "established_at" => DateTime.parse("01/07/2013"),
                                             "project_type" => "%%",
                                             "academy_type" => ""}, true).should == ["YEAR(started_at) = ? and MONTH(started_at) = ? and DAY(started_at) = ? and project_type LIKE ? ", 2013, 7, 1, "%%"]
        end
      end

      context "params are all not nil" do
        let(:params) { {"student_name" => "陈颖娴", "established" => {"at" => "01/07/2013"},
                        "project_type" => "电子科技大学优秀博士生出国培养", "academy_type" => "通信学院"} }
        it "should get checked_params hash" do
          controller.check_params_nil(params).first.should == {"student_name" => "陈颖娴",
                                                               "established_at" => DateTime.parse("01/07/2013"),
                                                               "project_type" => "电子科技大学优秀博士生出国培养",
                                                               "academy_type" => "通信学院"
          }
        end
        it "generate sql condition for project_type、academy_type and student_name  is nil" do
          controller.generate_sql_condition({"student_name" => "陈颖娴",
                                             "established_at" => DateTime.parse("01/07/2013"),
                                             "project_type" => "电子科技大学优秀博士生出国培养",
                                             "academy_type" => "通信学院"}, true).should ==
              ["YEAR(started_at) = ? and MONTH(started_at) = ? and DAY(started_at) = ? and project_type LIKE ? ", 2013, 7, 1, "电子科技大学优秀博士生出国培养"]
        end

      end

    end

  end

end
