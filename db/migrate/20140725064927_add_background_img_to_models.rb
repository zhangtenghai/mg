class AddBackgroundImgToModels < ActiveRecord::Migration
  def self.up
    add_attachment :users, :avatar
    add_attachment :news, :head_img
    add_attachment :games, :head_img
    add_attachment :articles, :head_img
  end

  def self.down
    remove_attachment :users, :avatar
    remove_attachment :news, :head_img
    remove_attachment :games, :head_img
    remove_attachment :articles, :head_img
  end
end
