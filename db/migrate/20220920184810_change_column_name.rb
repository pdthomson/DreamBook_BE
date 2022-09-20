class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_recommendations, :description, :author_name
  end
end
