class AddAdressToMuseum < ActiveRecord::Migration[7.0]
  def change
    add_column :museums, :address, :string
  end
end
