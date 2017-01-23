class VendorController < ApplicationController
	def index
		@vendor = Vendor.new
	end

	def post_registration
		@vendor = Vendor.new(vendor_params)
		@vendor.vendor_primary_email = @vendor.vendor_primary_email.downcase
		@vendor.year_participated = "2017"
		if @vendor.save
			redirect_to action: "registration_success"
		else
			render action: "index"
		end
	end

	def registration_success
		
	end

	def vendor_params
    params.require(:vendor).permit(:vendor_name, 
    	:vendor_address,
    	:vendor_primary_email,
    	:vendor_primary_phone,
    	:vendor_primary_name,
    	:vendor_secondary_phone,
    	:vendor_secondary_name,
    	:vendor_secondary_email,
    	:vendor_food_information,
    	:vendor_description,
    	:vendor_website,
    	:vendor_photo,
    	:pass,
    	:pass_confirmation, 
    	:agreement)
  end
end
