class AddAddressToStuffs < ActiveRecord::Migration[6.1]
  def change
    add_column :stuffs, :address, :string
  end
end
