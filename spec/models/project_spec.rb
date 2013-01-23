# encoding: utf-8
require 'spec_helper'

describe Project do
  let(:project_params) {{:paper_title => "干扰", # 拟定论文题目
                  :project_type => "电子科技大学优秀博士生出国培养", # 电子科技大学优秀博士生出国培养、教育部学术新人奖、中央高校基本科研业务费、电子科技大学优博选培计划、电子科技大学优博培育基金、电子科技大学优秀博士生学术支持计划项目
                  :stage => "申请阶段", # 项目当前阶段（申请阶段、立项阶段、答辩阶段）
                  :status => "待审核", # 项目当前状态（包括待审核、审核通过、审核不通过）
                  :started_at => Time.now,
                  :ended_at => Time.now}}

  describe "test for project state change" do
    it "pass project state from 申请阶段 to 立项阶段" do
      project = Project.create(project_params)
      project.update_status
      project.stage.should == "立项阶段"
      project.status.should == "待审核"
    end

    it  "pass project state from 立项阶段 to 答辩阶段" do
      project_params[:stage] = "立项阶段"
      project = Project.create(project_params)
      project.update_status
      project.stage.should == "答辩阶段"
      project.status.should == "待审核"
    end

    it  "change project state to finish" do
      project_params[:stage] = "答辩阶段"
      project = Project.create(project_params)
      project.complete_status
      project.stage.should == "答辩阶段"
      project.status.should == "审核通过"
    end
  end
end
