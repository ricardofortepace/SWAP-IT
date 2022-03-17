class AddActiveToStuffs < ActiveRecord::Migration[6.1]
  def change
    add_column :stuffs, :active, :boolean, default: true
  end
end
