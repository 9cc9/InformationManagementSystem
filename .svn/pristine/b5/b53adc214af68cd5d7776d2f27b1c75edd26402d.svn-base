class CreateFundManagements < ActiveRecord::Migration
  def change
    create_table :fund_managements do |t|
      t.integer :project_id
      t.integer :total_cost
      t.integer :consumed_cost,  :default => 0

      t.timestamps
    end
  end
end
