class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.user :references, null: false, foreign_key: true
      t.post :references, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
