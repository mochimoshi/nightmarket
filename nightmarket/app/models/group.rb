class Group < ApplicationRecord
	validates :group_name, :group_primary_name, :group_primary_email, :group_primary_phone, presence: true
  validates :group_primary_email, uniqueness: true
  validates :agreement, acceptance: true
end
