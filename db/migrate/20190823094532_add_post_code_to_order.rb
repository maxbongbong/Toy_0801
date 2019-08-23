class AddPostCodeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :post_code, :string
    add_column :orders, :address_3, :string
  end
end
