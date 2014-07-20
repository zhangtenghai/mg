class AddArticlesUserFavorties < ActiveRecord::Migration
  def change
    create_table :articles_user_favorites do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
