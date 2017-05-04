class Team < ApplicationRecord
  belongs_to :league
  has_many :players_teams
  has_many :players, :through => :players_teams
end
