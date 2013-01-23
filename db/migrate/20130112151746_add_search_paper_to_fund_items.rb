class AddSearchPaperToFundItems < ActiveRecord::Migration
  def change
    add_column :fund_items, :search_paper, :integer
  end
end
