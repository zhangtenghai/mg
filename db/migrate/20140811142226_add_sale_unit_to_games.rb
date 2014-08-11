class AddSaleUnitToGames < ActiveRecord::Migration
  def change
    add_column :games, :sale_unit, :string
  end
end
