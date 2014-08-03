class CreateGamesUserScores < ActiveRecord::Migration
  def change
    create_table :games_user_scores do |t|
      t.decimal :score, precision: 5, scale: 2
      t.integer :game_id
      t.integer :user_id
      t.timestamp
    end
  end
end
