#####################################
# 学术成果基类
# ①期刊论文（Achievement Periodical Paper Model)：
# 学术论文题目、期刊名字、发表期卷、期刊类别（SCI、SSCI、EI等）、SCI期刊影响因子、JCR分区
# ②会议论文(Achievement Conference Paper Model)：
# 学术论文题目、会议名字、发表期卷
# ③专利(Achievement Patent Model)：
# 专利类型、专利号、专利名称
# ④学术交流(Achievement Academic Exchange Model)：
# 参加学术交流的时间、地点、参加学术交流的会议名称及成果名称、参会形式（大会报告、分会报告、论文张贴）
# ⑤学术交流报告(Achievement Academic Exchange Report Model)：
# 报告的时间、地点、题目
#####################################
class AchievementItem < ActiveRecord::Base
  extend ExtendModel
  # 定义fund_created_at_with_format
  def_each_datetime_with_format :achieved_at


  attr_accessible :academic_exchange_address, # 报告的地点（4.5类）
                  :academic_exchange_name, # 学术交流名称（4）
                  :academic_exchange_publication_name, # 学术交流发表成果名称（4.5类）
                  :academic_exchange_time, # 报告的时间（4.5类）
                  :academic_exchange_type, # 学术交流类型（4）
                  :conference_name, # 会议名字（2）
                  :patent_id, :patent_name, :patent_type, # 专利相关（3）
                  :sci_impact_factor, :jcr, # SCI期刊影响因子（1），JCR分区 （1）
                  :paper_title, # 学术论文题目(1、2)
                  :periodical_name, :periodical_type, :periodical_volume, # 期刊名字(1)、期刊类别（SCI、SSCI、EI等）(1)、发表期卷(1、2类)
                  :student_id, # 关联学生id，与唯一学生id关联
                  :type, #关联子类
                  :achieved_at # 成果取得时间

  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"
  #
  #alias :achieved_at_without_format :achieved_at
  #
  #def achieved_at
  #  self.achieved_at_without_format.strftime("%Y/%m/%d")
  #rescue
  #  self.achieved_at_without_format
  #end
end



