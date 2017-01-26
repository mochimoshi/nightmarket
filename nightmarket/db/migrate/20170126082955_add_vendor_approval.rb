class AddVendorApproval < ActiveRecord::Migration[5.0]
  def change
    add_column :vendors, :approved, :boolean
  end
end
