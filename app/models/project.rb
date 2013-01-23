# encoding: utf-8
class Project < ActiveRecord::Base

  scope :pending_review_projects, :conditions => {:stage => "申请阶段", :status => "待审核"} # 待审核的项目列表
  scope :established_projects, :conditions => {:stage => "立项阶段", :status => "待审核"} # 已经立项的项目列表
  scope :pending_defense_projects, :conditions => {:stage => "结题阶段"} # 待答辩的项目列表

  attr_accessible :current_achievement,
                  :paper_title, # 拟定论文题目
                  :project_type, # 电子科技大学优秀博士生出国培养、教育部学术新人奖、中央高校基本科研业务费、电子科技大学优博选培计划、电子科技大学优博培育基金、电子科技大学优秀博士生学术支持计划项目
                  :stage, # 项目当前阶段（申请阶段、立项阶段、答辩阶段）
                  :status, # 项目当前状态（包括待审核、审核通过、审核不通过）
                  :started_at, :ended_at,
                  :student_id # 关联学生id

  has_one :fund_management, :foreign_key => "project_id" # 一对一关联资费管理
  has_many :file_uploader_arrivals, :foreign_key => "project_id" # 文档管理

  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"


  def stage_mapping
    {"申请阶段" => "立项阶段", "立项阶段" => "结题阶段"}
  end

  # 根据项目当前阶段和状态进行更新
  def update_status
    self.update_attribute(:stage, stage_mapping["#{self.stage}"])
  end

  # 结题
  def complete_status
    self.update_attribute(:status, "审核通过")
  end

  # 成果项转为json数组，作为js函数入口参数
  def achieve_items_to_json
    {"periodical_papers" => self.student.achievement_periodical_papers_with_scope(self.started_at, self.ended_at),# 期刊论文
    "conference_papers" => self.student.achievement_conference_papers_with_scope(self.started_at, self.ended_at),# 会议论文
    "patents" => self.student.achievement_patents_with_scope(self.started_at, self.ended_at), # 专利
    "academic_exchanges" => self.student.achievement_academic_exchanges_with_scope(self.started_at, self.ended_at), # 学术交流
    "academic_exchange_reports" => self.student.achievement_academic_exchange_reports_with_scope(self.started_at, self.ended_at), # 学术交流报告
    }.to_json
  end

end
