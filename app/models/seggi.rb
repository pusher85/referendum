class Seggi < ActiveRecord::Base
	has_one :rilevazioni
	has_one :prima
	has_one :seconda
	has_one :terza
end
