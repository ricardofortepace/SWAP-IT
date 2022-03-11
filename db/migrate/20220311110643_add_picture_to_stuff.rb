class AddPictureToStuff < ActiveRecord::Migration[6.1]
  def change
    add_column :stuffs, :stuff_picture, :string
  end
end
