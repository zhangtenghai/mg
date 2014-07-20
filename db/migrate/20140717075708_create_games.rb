class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :origin_name
      t.string :developer
      t.string :website
      t.string :publisher
      t.decimal :sale_price
      t.string :rating
      t.decimal :avg_score
      t.datetime :sale_date

      t.timestamps
    end
  end
end
