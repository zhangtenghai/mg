class CreateGamesUserFavorites < ActiveRecord::Migration
  def change
    create_table :games_user_favorites do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end

    create_table :news_user_favorites do |t|
      t.integer :user_id
      t.integer :news_id

      t.timestamps
    end
  end
end
