class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :purpose, null: false, foreign_key: true
      t.references :pet_category, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :pet_sex, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true
      t.string :pet_breed
      t.string :address_line
      t.datetime :happened_at, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
