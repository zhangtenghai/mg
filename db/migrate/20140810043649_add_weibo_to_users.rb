class AddWeiboToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weibo, :string
    add_column :users, :qq, :string
    add_column :users, :signature, :string
  end
end
