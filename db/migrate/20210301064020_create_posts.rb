class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.user :references, null: false, foreign_key: true
      t.purpose :references, null: false, foreign_key: true
      t.pet_category :references, null: false, foreign_key: true
      t.city :references, null: false, foreign_key: true
      t.pet_sex :references, null: false, foreign_key: true
      t.image :references, null: false, foreign_key: true
      t.string :pet_breed
      t.string :address_line
      t.datetime :happened_at, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
