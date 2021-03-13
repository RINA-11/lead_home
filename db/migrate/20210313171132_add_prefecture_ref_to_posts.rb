class AddPrefectureRefToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :prefecture, null: false, foreign_key: true
  end
end
