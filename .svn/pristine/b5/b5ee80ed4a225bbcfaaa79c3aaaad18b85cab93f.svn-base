# encoding: utf-8
require 'spec_helper'

describe ProjectProcessController do

  before do
    controller.stub(:authorize).and_return()
  end

  describe "add multiply fund items " do
    let(:fund_item_params) {
      {"1" => {"conference" => "1", "paper" => "1", "search_paper" => "1", "other" => "1"},
       "2" => {"conference" => "2", "paper" => "2", "search_paper" => "2", "other" => "2"}}
    }
    let(:project) { mock_model(Project) }
    let(:fund_management) { mock_model(FundManagement) }

    before do
      fund_management.stub(:id).and_return(1) # 返回id为1
      fund_management.stub(:consumed_cost).and_return(0)
      project.stub(:fund_management).and_return(fund_management)
    end

    # 测试add_fund_item 内部流程
    it "add fund items to fund management" do
      Project.should_receive(:find).and_return(project)
      fund_management.should_receive(:update_attribute)

      post :add_fund_item, :id => 1, :fund_item => fund_item_params
      response.should redirect_to(fund_management_show_path(1)) # 测试方法运行完毕后是否返回对应界面
    end

    # 测试sum_fund_items method 的正确性
    it "create fund items and sum total cost of all" do
      controller.sum_fund_items(fund_item_params, fund_management.id).should == 12
    end
  end

  describe "projects list based on different" do
    # 待审核的项目列表
    it "show pending review projects list" do
      Project.should_receive(:all).with(:conditions => {:stage =>"申请阶段", :status => "待审核"})
      post :pending_review_projects_list
      #response.should render_template("")
    end

    # 已经立项的项目列表
    it "show established projects list" do
      Project.should_receive(:all).with(:conditions => {:stage =>"立项阶段", :status => "待审核"})
      post :established_projects_list
    end

    # 待答辩的项目列表
    it "show pending defense projects list" do
      Project.should_receive(:all).with(:conditions => {:stage =>"答辩阶段"})
      post :pending_defense_projects_list
    end
  end


  describe "change projects status operation" do
    let(:project) { mock_model(Project) }
    before  do
      Project.stub(:find).and_return(project)
    end


    # 通过审核
    it "pass projects to another status" do
      Project.should_receive(:find)
      project.should_receive(:update_status)
      request.env['HTTP_REFERER'] = 'http://localhost:3000/established_projects_list/' # set back url
      get :pass_project, {:id => 1}
      response.should redirect_to("http://localhost:3000/established_projects_list/")
    end

    # 结题
    it "change projects to complete status"  do
      Project.should_receive(:find)
      project.should_receive(:complete_status)
      request.env['HTTP_REFERER'] = 'http://localhost:3000/pending_defense_projects_list/' # set back url
      get :complete_project, {:id => 1}
      response.should redirect_to("http://localhost:3000/pending_defense_projects_list/")
    end
  end


end
