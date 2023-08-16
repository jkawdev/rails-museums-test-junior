class AddCountryVisitorsToMuseums < ActiveRecord::Migration[7.0]
  def change
    add_column :museums, :country, :string
    add_column :museums, :visitors, :integer
  end
end
