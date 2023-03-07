class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :poster_url
      t.string :genre
      t.string :length
      t.float :rating

      t.timestamps
    end
  end
end
