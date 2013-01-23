#####################################
# 其他信息基类
# ①境外高校学习经历(Other Study Model,一对多）
# 项目名称（国家高水平大学公派研究生项目、研究生院博士生长短期访学项目、国际交流项目、导师合作科研项目等等）、起止时间、
# 国别（地区）、学校名称、学院名称
# ②就业单位（Other Employment Model，一对一）
# 就业单位名称、所在省市名称、单位性质（高校、科研院所、政府部门、事业单位、外企、国企、自主创业、出国留学、出国工作、军队等）、岗位类别（教学科研、公务员、行政管理、工程技术、科技研发等）

#####################################

class OtherInformationItem < ActiveRecord::Base
  attr_accessible :student_id, # 关联学生id，与唯一学生id关联
                  :type,  #关联子类
                  :academy, :company, :company_address, :company_property, :country,
                  :ended_at, :job_category, :project_name, :started_at, :university, :achieved_at # 成果取得时间


  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"

end
