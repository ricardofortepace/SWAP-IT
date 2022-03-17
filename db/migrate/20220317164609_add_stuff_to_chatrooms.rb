class AddStuffToChatrooms < ActiveRecord::Migration[6.1]
  def change
    Chatroom.destroy_all
    add_reference :chatrooms, :trading_stuff, null: false, foreign_key: {to_table: :stuffs}
    add_reference :chatrooms, :stuff, null: false, foreign_key: true
    remove_column :chatrooms, :name
  end
end
