class AddPetNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :pet_name, :string
  end
end
