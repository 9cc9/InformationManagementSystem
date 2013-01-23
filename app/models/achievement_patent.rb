#####################################
# ③专利(Achievement Patent Model)：
# 专利类型、专利号、专利名称
#####################################

class AchievementPatent < AchievementItem
  attr_accessible :patent_id, :patent_name, :patent_type # 专利相关（3）
  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"
end