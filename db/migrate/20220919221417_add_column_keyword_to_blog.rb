class AddColumnKeywordToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :keyword, :string
  end
end
