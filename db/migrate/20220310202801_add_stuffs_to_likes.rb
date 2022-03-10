class AddStuffsToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :trading_stuff, null: false, foreign_key: {to_table: :stuffs}
  end
end
