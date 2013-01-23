class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :school_number
      t.string :major
      t.string :phone_number
      t.string :email
      t.string :doctor_type
      t.string :teacher_name
      t.string :academy
      t.datetime :graduation_time
      t.boolean :is_graduated  # 是否毕业，true为已毕业

      t.timestamps
    end
  end
end
