class AddPetNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pet_name, :string
  end
end
