class AddAvatarToTeams < ActiveRecord::Migration[5.0]
  def self.up
    change_table :teams do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :teams, :avatar
  end
end
