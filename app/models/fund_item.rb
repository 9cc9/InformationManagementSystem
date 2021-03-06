class FundItem < ActiveRecord::Base
  extend ExtendModel
  # 定义fund_created_at_with_format
  def_each_datetime_with_format :fund_created_at

  attr_accessible :conference, # 高水平会议
                  :paper,  # 高水平论文
                  :search_paper, # 查询文献
                  :other, # 其他
                  :total, # 总计
                  :fund_management_id,
                  :fund_created_at # 资费报账时间


  belongs_to :fund_management,
             :class_name => "FundManagement",
             :foreign_key => "fund_management_id"

  # 在创建完成前执行total运算
  before_create :count_total
  def count_total
    self.total = self.conference + self.paper + self.search_paper + self.other
    self.fund_created_at = Time.now
  end


  # 将fund_item信息转为json数组，列表页面打印
  def information_to_json
    {"fund_created_at" => self.fund_created_at_with_format,
     "conference" => self.conference,
     "paper" => self.paper,
     "search_paper" => self.search_paper,
     "other" => self.other,
     "total" => self.total
    }
  end
end
