class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.post :references, null: false, foreign_key: true
      t.string :post_image, null: false

      t.timestamps
    end
  end
end
