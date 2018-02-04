class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|

      t.timestamps

      t.string      :vendor_name
      t.string      :vendor_package
      t.string			:vendor_address
      t.string      :vendor_primary_name
      t.string			:vendor_primary_email
      t.string			:vendor_primary_phone
      t.string      :vendor_preferred_contact
      t.string      :vendor_secondary_name
      t.string			:vendor_secondary_email
      t.string			:vendor_secondary_phone
      t.string			:vendor_food_information
      t.string			:vendor_description
      t.string			:vendor_website
      t.string			:vendor_photo
      t.string			:password
      t.string			:salt
      t.string			:year_participated
    end
  end
end
