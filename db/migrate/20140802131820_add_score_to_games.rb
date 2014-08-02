class AddScoreToGames < ActiveRecord::Migration
  def change
    add_column :games, :score, :decimal
    add_column :games, :summary, :string
  end
end
