require 'spec_helper'

describe FundManagement do

  let(:params) {{:consumed_cost => 500,:total_cost => 3000}}
  let(:fund_management) {FundManagement.create(params)}

  # 构造fund_item测试用例
  before do
    fund_management.fund_items.create({:conference => 30, # 高水平会议
                                       :paper => 20,  # 高水平论文
                                       :search_paper => 10, # 查询文献
                                       :other => 40})
    fund_management.fund_items.create({:conference => 60, # 高水平会议
                                       :paper => 40,  # 高水平论文
                                       :search_paper => 20, # 查询文献
                                       :other => 80})
    fund_management.fund_items.create({:conference => 60, # 高水平会议
                                       :paper => 40,  # 高水平论文
                                       :search_paper => 20, # 查询文献
                                       :other => 80})
  end

  describe "total cost" do
    it "get conference total cost" do
      fund_management.conference_total.should == 150
    end
    it "get paper total cost" do
      fund_management.paper_total.should == 100
    end
    it "get search paper total cost" do
      fund_management.search_paper_total.should == 50
    end
    it "get other total cost" do
      fund_management.other_total.should == 200
    end
  end

  describe "residual amount" do
    it "get residual amount" do
      fund_management.residual_amount.should == 2500
    end

  end

end
