class Utilisateur < ApplicationRecord
	has_many :actions, dependent: :destroy
	validates :identifiant, presence:true
	validates :nom, presence:true
	validates :motdepasse, presence:true
end
