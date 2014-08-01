class AddAvatarToVoices < ActiveRecord::Migration
  def self.up
    add_attachment :voices, :avatar
  end

  def self.down
    remove_attachment :voices, :avatar
  end
end
