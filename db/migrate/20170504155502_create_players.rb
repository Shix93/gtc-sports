class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.integer :height
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
