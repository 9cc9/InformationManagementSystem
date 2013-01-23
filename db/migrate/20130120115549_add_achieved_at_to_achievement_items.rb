class AddAchievedAtToAchievementItems < ActiveRecord::Migration
  def change
    add_column :achievement_items, :achieved_at, :datetime
  end
end
