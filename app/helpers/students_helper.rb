# encoding: utf-8
module StudentsHelper
  def show_graduated_state
    (@student.is_graduated)?"已毕业":"未毕业"
  end

  # 返回数组结构的student information json格式数据
  def search_results(students)
    students.collect {|student| student.information_to_json}
  end

end
