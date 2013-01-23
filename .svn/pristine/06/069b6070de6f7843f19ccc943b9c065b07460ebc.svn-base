class FundItem < ActiveRecord::Base
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
end
