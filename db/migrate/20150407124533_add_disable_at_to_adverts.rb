class AddDisableAtToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :disabled_at, :datetime
  end
end
