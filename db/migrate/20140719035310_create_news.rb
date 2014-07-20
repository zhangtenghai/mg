class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.integer :user_id
      t.string :content
      t.datetime :posted_at
      t.integer :game_id

      t.timestamps
    end
  end
end
