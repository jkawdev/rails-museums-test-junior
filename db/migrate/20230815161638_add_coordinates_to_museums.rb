class AddCoordinatesToMuseums < ActiveRecord::Migration[7.0]
  def change
    add_column :museums, :latitude, :float
    add_column :museums, :longitude, :float
  end
end
