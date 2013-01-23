# encoding: utf-8
#####################################
# 项目流程处理类
#####################################

class ProjectProcessController < ApplicationController
  before_filter :authorize


  # 待审核的项目列表
  def pending_review_projects_list
    @projects = Project.pending_review_projects.paginate(:page => params[:page], :per_page => 10)
  end

  # 已经立项的项目列表
  def established_projects_list
    @projects = Project.established_projects.paginate(:page => params[:page], :per_page => 10)
  end

  # 待答辩的项目列表
  def pending_defense_projects_list
    @projects = Project.pending_defense_projects.paginate(:page => params[:page], :per_page => 10)
  end

  # 所有未通过审核的项目列表
  def not_pass_projects_list

  end

  # 通过审核
  def pass_project
    Project.find(params[:id]).update_status
    redirect_to :back
  end

  # 结题
  def complete_project
    Project.find(params[:id]).complete_status
    redirect_to :back
  end

  # 资费管理页面
  def fund_management_show
    @project = Project.find(params[:id])
    @fund_management = @project.fund_management
  end

  # 增加资费条目
  def add_fund_item
    fund_management = Project.find(params[:id]).fund_management # 获取project对应fund_management 实例

    fund_management.update_attribute(:consumed_cost, fund_management.consumed_cost +
        sum_fund_items(params[:fund_item], fund_management)) # 更新consumed_cost总额
    redirect_to fund_management_show_path(params[:id])
  end

  # 创建fund_items，并返回总花费
  def sum_fund_items(fund_items, fund_management)
    sum_cost = 0
    fund_items.each do |item|
      fund_item = fund_management.fund_items.create(item[1])
      sum_cost += fund_item.total # 所有新建fund_items求和
    end
    sum_cost
  end

  # 文档管理页面
  def file_management_show
    @project = Project.find(params[:id])
    @fund_management = @project.fund_management
    @file_uploader_arrivals = @project.file_uploader_arrivals
  end

  # 下载文档
  def download_local_file
    file_address = "#{Rails.public_path}" + params[:file_address]
    io = File.open(file_address)
    io.binmode # 二进制
    send_data(io.read,
              :filename => file_address,
              :type => "a.jpg",
              :disposition => "attachment")
    io.close
  end

  def add_file_item
    project = Project.find(params[:id])
    (params || []).each do |key, value|
      if (/^file_item_div/ =~ key) != nil
        uploader = project.file_uploader_arrivals.create(:file_avatar => value)
      end
    end
    redirect_to file_management_show_path(params[:id])
  end

end
