class CreateDelegates < ActiveRecord::Migration[5.0]
  def change
    create_table :delegates do |t|
    	t.string :name
    	

      t.timestamps
    end
  end
end
