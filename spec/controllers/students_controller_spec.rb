# encoding: utf-8
require 'spec_helper'


describe StudentsController do

  before do
    controller.stub(:authorize).and_return()
  end

  ## This should return the minimal set of attributes required to create a valid
  ## Student. As you add validations to Student, be sure to
  ## update the return value of this method accordingly.
  #def valid_attributes
  #  { "name" => "MyString" }
  #end
  #
  ## This should return the minimal set of values that should be in the session
  ## in order to pass any filters (e.g. authentication) defined in
  ## StudentsController. Be sure to keep this updated too.
  #def valid_session
  #  {}
  #end
  #
  #describe "GET index" do
  #  it "assigns all students as @students" do
  #    student = Student.create! valid_attributes
  #    get :index, {}, valid_session
  #    assigns(:students).should eq([student])
  #  end
  #end
  #
  #describe "GET show" do
  #  it "assigns the requested student as @student" do
  #    student = Student.create! valid_attributes
  #    get :show, {:id => student.to_param}, valid_session
  #    assigns(:student).should eq(student)
  #  end
  #end
  #
  #describe "GET new" do
  #  it "assigns a new student as @student" do
  #    get :new, {}, valid_session
  #    assigns(:student).should be_a_new(Student)
  #  end
  #end
  #
  #describe "GET edit" do
  #  it "assigns the requested student as @student" do
  #    student = Student.create! valid_attributes
  #    get :edit, {:id => student.to_param}, valid_session
  #    assigns(:student).should eq(student)
  #  end
  #end
  #
  #describe "POST create" do
  #  describe "with valid params" do
  #    it "creates a new Student" do
  #      expect {
  #        post :create, {:student => valid_attributes}, valid_session
  #      }.to change(Student, :count).by(1)
  #    end
  #
  #    it "assigns a newly created student as @student" do
  #      post :create, {:student => valid_attributes}, valid_session
  #      assigns(:student).should be_a(Student)
  #      assigns(:student).should be_persisted
  #    end
  #
  #    it "redirects to the created student" do
  #      post :create, {:student => valid_attributes}, valid_session
  #      response.should redirect_to(Student.last)
  #    end
  #  end
  #
  #  describe "with invalid params" do
  #    it "assigns a newly created but unsaved student as @student" do
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Student.any_instance.stub(:save).and_return(false)
  #      post :create, {:student => { "name" => "invalid value" }}, valid_session
  #      assigns(:student).should be_a_new(Student)
  #    end
  #
  #    it "re-renders the 'new' template" do
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Student.any_instance.stub(:save).and_return(false)
  #      post :create, {:student => { "name" => "invalid value" }}, valid_session
  #      response.should render_template("new")
  #    end
  #  end
  #end
  #
  #describe "PUT update" do
  #  describe "with valid params" do
  #    it "updates the requested student" do
  #      student = Student.create! valid_attributes
  #      # Assuming there are no other students in the database, this
  #      # specifies that the Student created on the previous line
  #      # receives the :update_attributes message with whatever params are
  #      # submitted in the request.
  #      Student.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
  #      put :update, {:id => student.to_param, :student => { "name" => "MyString" }}, valid_session
  #    end
  #
  #    it "assigns the requested student as @student" do
  #      student = Student.create! valid_attributes
  #      put :update, {:id => student.to_param, :student => valid_attributes}, valid_session
  #      assigns(:student).should eq(student)
  #    end
  #
  #    it "redirects to the student" do
  #      student = Student.create! valid_attributes
  #      put :update, {:id => student.to_param, :student => valid_attributes}, valid_session
  #      response.should redirect_to(student)
  #    end
  #  end
  #
  #  describe "with invalid params" do
  #    it "assigns the student as @student" do
  #      student = Student.create! valid_attributes
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Student.any_instance.stub(:save).and_return(false)
  #      put :update, {:id => student.to_param, :student => { "name" => "invalid value" }}, valid_session
  #      assigns(:student).should eq(student)
  #    end
  #
  #    it "re-renders the 'edit' template" do
  #      student = Student.create! valid_attributes
  #      # Trigger the behavior that occurs when invalid params are submitted
  #      Student.any_instance.stub(:save).and_return(false)
  #      put :update, {:id => student.to_param, :student => { "name" => "invalid value" }}, valid_session
  #      response.should render_template("edit")
  #    end
  #  end
  #end
  #
  #describe "DELETE destroy" do
  #  it "destroys the requested student" do
  #    student = Student.create! valid_attributes
  #    expect {
  #      delete :destroy, {:id => student.to_param}, valid_session
  #    }.to change(Student, :count).by(-1)
  #  end
  #
  #  it "redirects to the students list" do
  #    student = Student.create! valid_attributes
  #    delete :destroy, {:id => student.to_param}, valid_session
  #    response.should redirect_to(students_url)
  #  end
  #end

  # 增加学生成果条目
  describe "add achievement items" do
    let(:student) { mock_model(Student) }
    let(:achievement_item_params) {
      {"1" => {"paper_title" => "导师", "periodical_name" => "导师", "periodical_type" => "导师", "periodical_volume" => "导师", "sci_impact_factor" => "导师", "jcr" => "导师", "type" => "AchievementPeriodicalPaper"},
       "2" => {"patent_name" => "专利", "patent_type" => "专利", "patent_id" => "专利", "type" => "AchievementPatent"}}
    }
    let(:other_information_item_params) {
      {"0" => {"project_name" => "项目", "country" => "项目", "university" => "项目", "academy" => "项目", "started_at" => "项目", "ended_at" => "项目", "type" => "OtherStudy"},
       "2" => {"company" => "单位名称", "company_address" => "单位名称", "company_property" => "单位名称", "job_category" => "单位名称", "type" => "OtherEmployment"}}
    }

    before do
      student.stub(:id).and_return(1)
    end

    it "add achievement items process" do
      Student.should_receive(:find).and_return(student)
      student.should_receive(:create_achievement_items_with_params)

      post :add_achievement_item, :id => 1, :achievement_item => achievement_item_params
      response.should redirect_to(student_path(1)) # 测试方法运行完毕后是否返回对应界面
    end

    it "add other information items process" do
      Student.should_receive(:find).and_return(student)
      student.should_receive(:create_other_information_items_with_params)

      post :add_other_information_item, :id => 1, :achievement_item => other_information_item_params
      response.should redirect_to(student_path(1)) # 测试方法运行完毕后是否返回对应界面
    end
  end

  describe "process students search" do
    # 检查参数是否为空
    describe "check params" do
      let(:students) {[stub(:check_project_type => true), stub(:check_project_type => false),
                                                 stub(:check_project_type => true), stub(:check_project_type => false),
                                                 stub(:check_project_type => true)]}
      context "all params are nil" do
        let(:params) { {"major" => "", "school_number" => "",
                        "project_type" => "-", "academy" => "-"} }
        it "should get checked_params hash" do
          controller.generate_sql_condition(params).first.should == ""
          controller.generate_sql_condition(params).second.should == false
        end

        it "should get all students " do
          Student.should_receive(:all).and_return(students)
          post :process_students_search, params
          assigns(:students).size.should == 5
        end
      end

      context "params include major、school_number and academy  is nil" do
        let(:params) { {"major" => "", "school_number" => "",
                        "project_type" => "电子科技大学优秀博士生出国培养", "academy" => "-"} }

        it "should get checked_params hash" do
          controller.generate_sql_condition(params).first.should == ""
          controller.generate_sql_condition(params).second.should == true
        end
        it "should get exactly suit for project_type " do
          Student.should_receive(:all).and_return(students)
          post :process_students_search, params
          assigns(:students).size.should == 3
        end
      end

      context "params are all not nil" do
        let(:params) { {"major" => "信号与系统", "school_number" => "201221010307",
                        "project_type" => "电子科技大学优秀博士生出国培养", "academy" => "通信与信息工程学院"} }
        it "should get checked_params hash" do
          controller.generate_sql_condition(params).first.should == " major LIKE '%信号与系统%' and school_number LIKE '%201221010307%' and academy LIKE '%通信与信息工程学院%' "
          controller.generate_sql_condition(params).second.should == true
        end
        it "should get exactly suit for all conditions " do
        end
      end

    end

  end

end
