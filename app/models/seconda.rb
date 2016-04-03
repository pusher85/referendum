class Seconda < ActiveRecord::Base
	belongs_to :seggi

	validates :maschi, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
	validates :femmine, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
end
