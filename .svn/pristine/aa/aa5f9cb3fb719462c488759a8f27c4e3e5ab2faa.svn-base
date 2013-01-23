
#####################################
# ①期刊论文（Achievement Periodical Paper Model)：
# 学术论文题目、期刊名字、发表期卷、期刊类别（SCI、SSCI、EI等）、SCI期刊影响因子、JCR分区
#####################################
class AchievementPeriodicalPaper < AchievementItem

  attr_accessible :sci_impact_factor, :jcr,  # SCI期刊影响因子（1），JCR分区 （1）
                  :paper_title,                # 学术论文题目(1、2)
                  :periodical_name, :periodical_type, :periodical_volume # 期刊名字(1)、期刊类别（SCI、SSCI、EI等）(1)、发表期卷(1、2类)

  belongs_to :student,
             :class_name => "Student",
             :foreign_key => "student_id"
end