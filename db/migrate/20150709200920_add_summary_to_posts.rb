class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :summary_id, :integer
    add_index :posts, :summary_id
  end
end
