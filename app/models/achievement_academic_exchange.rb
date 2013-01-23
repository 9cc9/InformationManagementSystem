#####################################
# ④学术交流(Achievement Academic Exchange Model)：
# 参加学术交流的时间、地点、参加学术交流的会议名称及成果名称、参会形式（大会报告、分会报告、论文张贴）
#####################################

class AchievementAcademicExchange < AchievementItem
  attr_accessible :academic_exchange_address,# 报告的地点（4.5类）
                  :academic_exchange_name,   # 学术交流名称（4）
                  :academic_exchange_publication_name, # 学术交流发表成果名称（4.5类）
                  :academic_exchange_time,   # 报告的时间（4.5类）
                  :academic_exchange_type   # 学术交流类型（4）

  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"
end