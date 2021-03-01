class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      t.user :references, null: false, foreign_key: true
      t.post :references, null: false, foreign_key: true

      t.timestamps
    end
  end
end
