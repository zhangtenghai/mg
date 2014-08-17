class AddSummaryToNews < ActiveRecord::Migration
  def change
    add_column :news, :summary, :string, limit: 500 
  end
end
