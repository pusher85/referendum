class Finale < ActiveRecord::Base
	belongs_to :seggi

	validates :si, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
	validates :no, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
	validates :bianche, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
	validates :nulle, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
	validates :contestate, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
end
