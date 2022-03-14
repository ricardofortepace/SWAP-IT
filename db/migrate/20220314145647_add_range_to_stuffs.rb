class AddRangeToStuffs < ActiveRecord::Migration[6.1]
  def change
    add_column :stuffs, :range, :integer
  end
end
