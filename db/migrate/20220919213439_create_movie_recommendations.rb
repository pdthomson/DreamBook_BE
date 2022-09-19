class CreateMovieRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_recommendations do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.references :blog, foreign_key: true
    end
  end
end
