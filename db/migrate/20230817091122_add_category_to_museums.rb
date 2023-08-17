class AddCategoryToMuseums < ActiveRecord::Migration[7.0]
  def change
    add_column :museums, :category, :string
  end
end
