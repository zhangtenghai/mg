class AddLockedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locked_at, :datetime
    add_column :users, :unlock_token, :string
  end
end
