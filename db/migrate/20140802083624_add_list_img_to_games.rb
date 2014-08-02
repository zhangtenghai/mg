class AddListImgToGames < ActiveRecord::Migration
  def self.up
    add_attachment :games, :list_img
  end

  def self.down
    remove_attachment :games, :list_img
  end
end
