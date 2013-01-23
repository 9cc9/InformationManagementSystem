
#####################################
# 文档类关联表
############
class FileUploaderArrival < ActiveRecord::Base
  attr_accessible :project_id, :file_avatar

  mount_uploader :file_avatar, FileAvatarUploader

  belongs_to :project,
             :class_name => "Project",
             :foreign_key => "project_id"
end
