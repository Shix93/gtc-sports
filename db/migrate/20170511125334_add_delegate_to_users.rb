class AddDelegateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :delegate, index: true
    add_foreign_key :users, :delegates
  end
end
