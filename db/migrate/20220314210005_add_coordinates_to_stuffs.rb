class AddCoordinatesToStuffs < ActiveRecord::Migration[6.1]
  def change
    add_column :stuffs, :latitude, :float
    add_column :stuffs, :longitude, :float
  end
end
