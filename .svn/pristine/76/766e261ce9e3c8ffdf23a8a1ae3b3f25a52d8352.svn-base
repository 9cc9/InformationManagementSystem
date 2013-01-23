
#####################################
# ②就业单位（Other Employment Model，一对一）
# 就业单位名称、所在省市名称、单位性质（高校、科研院所、政府部门、事业单位、外企、国企、自主创业、出国留学、出国工作、军队等）、
# 岗位类别（教学科研、公务员、行政管理、工程技术、科技研发等）
#####################################
class OtherEmployment < OtherInformationItem
  attr_accessible :company, :company_address, :company_property, # 就业单位名称、所在省市名称、单位性质
                  :job_category # 岗位类别

  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"
end