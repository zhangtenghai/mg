class AddTypeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category, :string
    add_column :articles, :topic, :string
    add_column :articles, :summary, :string
  end
end
