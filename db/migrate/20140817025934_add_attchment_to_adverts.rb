class AddAttchmentToAdverts < ActiveRecord::Migration
  def self.up
    add_attachment :adverts, :list_img
  end

  def self.down
    remove_attachment :adverts, :list_img
  end
end
