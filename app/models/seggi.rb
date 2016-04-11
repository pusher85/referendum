class Seggi < ActiveRecord::Base
	has_one :rilevazioni, :dependent => :destroy
	has_one :prima, :dependent => :destroy
	has_one :seconda, :dependent => :destroy
	has_one :terza, :dependent => :destroy
	has_one :finale, :dependent => :destroy

	validates :descrizione, presence: true
	validates :numero, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
	validates :maschi, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
	validates :femmine, presence: true, numericality: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
end
