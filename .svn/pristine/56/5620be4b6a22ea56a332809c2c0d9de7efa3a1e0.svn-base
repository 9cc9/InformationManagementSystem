class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :paper_title
      t.datetime :started_at
      t.datetime :ended_at
      t.string :stage,  :default => "申请阶段"
      t.string :status ,  :default => "待审核"
      t.text :current_achievement
      t.integer :student_id
      t.string :project_type

      t.timestamps
    end
  end
end
