class RemoveAttachmentToTables < ActiveRecord::Migration
  def self.up
    remove_attachment :adverts, :list_img
    add_column :adverts, :list_img, :string

    remove_attachment :news, :list_img
    remove_attachment :news, :head_img
    add_column :news, :list_img, :string
    add_column :news, :head_img, :string

    remove_attachment :articles, :head_img
    remove_attachment :articles, :avatar
    add_column :articles, :avatar, :string
    add_column :articles, :head_img, :string

    remove_attachment :games, :head_img
    remove_attachment :games, :list_img
    remove_attachment :games, :avatar
    add_column :games, :avatar, :string
    add_column :games, :head_img, :string
    add_column :games, :list_img, :string

    remove_attachment :users, :avatar 
    add_column :users, :avatar, :string

    remove_attachment :voices, :avatar
    add_column :voices, :avatar, :string 
  end

  def self.down
    add_attachment :adverts, :list_img
    remove_column :adverts, :list_img

    add_attachment :news, :list_img
    add_attachment :news, :head_img
    remove_column :news, :list_img
    remove_column :news, :head_img

    add_attachment :articles, :head_img
    add_attachment :articles, :avatar
    remove_column :articles, :avatar
    remove_column :articles, :head_img

    add_attachment :games, :head_img
    add_attachment :games, :list_img
    add_attachment :games, :avatar
    remove_column :games, :avatar
    remove_column :games, :head_img
    remove_column :games, :list_img

    add_attachment :users, :avatar 
    remove_column :users, :avatar

    add_attachment :voices, :avatar
    remove_column :voices, :avatar
  end
end
