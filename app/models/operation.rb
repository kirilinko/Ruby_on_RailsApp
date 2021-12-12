class Operation < ApplicationRecord
	belongs_to :utilisateur
	validates :type_operation, presence:true
	validates :montant, presence:true
	validates :motif, presence:true
	validates :ladate, presence:true
	validates :utilisateur_id, presence:true
end
