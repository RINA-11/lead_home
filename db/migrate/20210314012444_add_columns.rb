class AddColumns < ActiveRecord::Migration[5.2]
  
  def change
    add_column :images, :post_image2, :string
    add_column :images, :post_image3, :string
    add_column :images, :post_image4, :string
    add_column :images, :post_image5, :string
  end
  
end