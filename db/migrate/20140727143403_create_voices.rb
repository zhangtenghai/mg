class CreateVoices < ActiveRecord::Migration
  def change
    create_table :voices do |t|
      t.string :content
      t.string :user_name
      t.string :user_title
      t.datetime :disabled_at
      t.timestamps
    end
  end
end
