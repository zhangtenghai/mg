class ChangeLengthToTables < ActiveRecord::Migration
  def change
    change_column :games, :summary, :string, :limit => 500
    change_column :articles, :summary, :string, :limit => 500
  end
end
