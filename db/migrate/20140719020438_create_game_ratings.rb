class CreateGameRatings < ActiveRecord::Migration
  def change
    create_table :game_ratings do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :rating

      t.timestamps
    end
  end
end
