#####################################
# 资费管理(Fund Management Model)：
# 参加学术交流的时间、地点、参加学术交流的会议名称及成果名称、参会形式（大会报告、分会报告、论文张贴）
#####################################
class FundManagement < ActiveRecord::Base
  attr_accessible :consumed_cost, # 已经报销的花费
                  :total_cost, # 项目总金额
                  :project_id # 关联项目id

  has_many :fund_items, :foreign_key => "fund_management_id"  # 关联多个fund_items
  belongs_to :project,
             :class_name => "Project",
             :foreign_key => "project_id"

  # 定义conference_total、paper_total、search_paper_total、other_total
  def self.def_each_total(*method_names)
    method_names.each do |method_name|
      define_method(method_name.to_s + "_total") do
        self.fund_items.sum {|item| item.send(method_name)}
      end
    end
  end
  def_each_total :conference, :paper, :search_paper, :other

  # 项目剩余金额
  def residual_amount
    self.total_cost - self.consumed_cost
  end



end
