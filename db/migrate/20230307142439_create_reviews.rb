class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
