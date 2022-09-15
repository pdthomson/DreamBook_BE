class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.boolean :status, default: 1 

      t.timestamps
    end
  end
end
