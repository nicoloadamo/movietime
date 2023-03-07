class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :language
      t.integer :max_registrations
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :start_time
      t.datetime :end_time
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
