class CreateOtherInformationItems < ActiveRecord::Migration
  def change
    create_table :other_information_items do |t|
      t.string :type                # 关联子类
      t.integer :student_id        # 关联学生id
      t.string :project_name       # 项目名称(1)
      t.datetime :started_at       # 起止时间(1)
      t.datetime :ended_at
      t.string :country            # 国别（地区）(1)
      t.string :university         # 学校名称 (1)
      t.string :academy            # 学院名称(1)
      t.string :job_category      # 岗位类别（教学科研、公务员、行政管理、工程技术、科技研发等）(2)
      t.string :company           # 就业单位名称(2)
      t.string :company_address  # 所在省市名称(2)
      t.string :company_property # 单位性质（高校、科研院所、政府部门、事业单位、外企、国企、自主创业、出国留学、出国工作、军队等）(2)

      t.timestamps
    end
  end
end
