
#####################################
# ②会议论文（Achievement Conference Paper Model)：
# 学术论文题目、会议名字、发表期卷
#####################################

class AchievementConferencePaper < AchievementItem
  attr_accessible :conference_name,           # 会议名字（2）
                  :paper_title,                # 学术论文题目(1、2)
                  :periodical_volume         #发表期卷(1、2类)

  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"
end