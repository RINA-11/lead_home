class RenamePostImageColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :post_image, :post_image1
  end
end