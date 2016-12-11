class AuthorizedStudent < ApplicationRecord
	validates :email, presence: true
	validates :email, uniqueness: true

	def display_role
		if self.role == "siteowner"
			return "Site Owner"
		else
			return "Member"
		end
	end
end
