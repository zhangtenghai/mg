class AddDisabledAtToTables < ActiveRecord::Migration
  def change
    add_column :users, :disabled_at, :datetime
    add_column :articles, :disabled_at, :datetime
    add_column :games, :disabled_at, :datetime
    add_column :comments, :disabled_at, :datetime
    add_column :news, :disabled_at, :datetime
  end
end
