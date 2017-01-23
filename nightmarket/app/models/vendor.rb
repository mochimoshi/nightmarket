class Vendor < ApplicationRecord
	require 'digest'
	require 'securerandom'

	validates :vendor_name, :vendor_primary_name, :vendor_primary_email, :vendor_primary_phone, :vendor_address, :pass, :pass_confirmation, :vendor_food_information, presence: true
  validates :vendor_primary_email, uniqueness: true
  validates :pass, length: {minimum: 6, maximum: 64}
  validates :pass, confirmation: true
  validates :agreement, acceptance: true

  def pass
    return @password
  end

  def pass=(password)
    self.salt = SecureRandom::hex(16)
    self.password = Digest::SHA256.hexdigest(password + self.salt)
    @password = password
  end

  def password_valid?(password)
    return self.password == Digest::SHA256.hexdigest(password + self.salt).to_s
  end
end
