class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
