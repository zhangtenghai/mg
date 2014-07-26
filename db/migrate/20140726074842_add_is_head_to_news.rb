class AddIsHeadToNews < ActiveRecord::Migration
  def change
    add_column :news, :is_head, :boolean
  end
end
