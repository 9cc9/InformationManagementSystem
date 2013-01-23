# encoding: utf-8
module ApplicationHelper
  def will_paginate_options
    {:previous_label => "« 上页", :next_label => "下页 »", :container => false}
  end

  def role_control_projects_list
    if current_user.role_id <= 1
      li_list = "<li><a href='/projects/new'>创建新项目</a></li>
        <li><a href='/pending_review_projects_list'>待审核的项目</a></li>
        <li><a href='/established_projects_list'>已立项的项目</a></li>
        <li><a href='/pending_defense_projects_list'>待答辩的项目</a></li>"
    end
    li_list || ""
  end

  def role_control_students_list
    li_lists = "<a href='/students/new'>新建学生</a>" if current_user.role_id <= 1
    li_lists || ""
  end

  def role_control_users_list
    li_lists = "<a href='/users/new'>新建用户</a>" if current_user.role_id < 1
    li_lists || ""
  end
end
