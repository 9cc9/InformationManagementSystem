class CreateAchievementItems < ActiveRecord::Migration
  def change
    create_table :achievement_items do |t|
      t.string :type                                            # 关联子类
      t.integer :student_id                                   # 关联学生id
      t.string :paper_title                                  # 学术论文题目(1)
      t.string :periodical_name                             # 期刊名字(1)
      t.string :periodical_volume                          # 发表期卷(1、2类)
      t.string :periodical_type                            # 期刊类别（SCI、SSCI、EI等）(1)
      t.string :sci_impact_factor                         # SCI期刊影响因子（1）
      t.string :jcr                                         # JCR分区 （1）
      t.string :conference_name                           # 会议名字（2）
      t.string :patent_type                               # 专利类型（3）
      t.string :patent_id                                 # 专利号（3）
      t.string :patent_name                              # 专利名称（3）
      t.datetime :academic_exchange_time               # 报告的时间（4.5类）
      t.string :academic_exchange_address             # 报告的地点（4.5类）
      t.string :academic_exchange_publication_name  # 学术交流发表成果名称（4.5类）
      t.string :academic_exchange_name               # 学术交流名称（4）
      t.string :academic_exchange_type              # 学术交流类型（4）

      t.timestamps
    end
  end
end
