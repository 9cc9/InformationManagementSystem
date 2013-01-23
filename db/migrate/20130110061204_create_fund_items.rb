class CreateFundItems < ActiveRecord::Migration
  def change
    create_table :fund_items do |t|
      t.integer :fund_management_id
      t.integer :conference
      t.integer :paper
      t.integer :other
      t.integer :total

      t.timestamps
    end
  end
end
