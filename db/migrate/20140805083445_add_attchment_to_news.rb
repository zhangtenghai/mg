class AddAttchmentToNews < ActiveRecord::Migration
  def self.up
    add_attachment :news, :list_img
  end

  def self.down
    remove_attachment :news, :list_img
  end
end
