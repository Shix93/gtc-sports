class Team < ApplicationRecord
  belongs_to :league
  has_many :players_teams, dependent: :destroy
  has_many :players, :through => :players_teams
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
