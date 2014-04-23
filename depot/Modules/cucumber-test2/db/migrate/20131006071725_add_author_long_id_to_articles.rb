class AddAuthorLongIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author_long_id, :integer
  end
end
