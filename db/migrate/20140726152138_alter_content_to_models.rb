class AlterContentToModels < ActiveRecord::Migration
  def change
    change_column :news, :content, :text
    change_column :articles, :content, :text
  end
end
