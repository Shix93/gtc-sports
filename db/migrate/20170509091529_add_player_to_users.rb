class AddPlayerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :player, index: true
    add_foreign_key :users, :players
  end
end
