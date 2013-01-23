#####################################
# ①境外高校学习经历(Other Study Model,一对多）
# 项目名称（国家高水平大学公派研究生项目、研究生院博士生长短期访学项目、国际交流项目、导师合作科研项目等等）、起止时间、
# 国别（地区）、学校名称、学院名称
#####################################

class OtherStudy < OtherInformationItem
  attr_accessible  :project_name, #项目名称
                   :started_at, :ended_at, #起止时间
                   :country, :university, :academy  # 国别（地区）、学校名称、学院名称
  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"
end