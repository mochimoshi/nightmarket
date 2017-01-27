class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|

      t.timestamps

      t.string      :group_name
      t.string      :group_primary_name
      t.string			:group_primary_email
      t.string			:group_primary_phone
      t.string      :group_secondary_name
      t.string			:group_secondary_email
      t.string			:group_secondary_phone
      t.string			:group_food_information
      t.string			:group_booth_size
      t.string			:group_performance_information
      t.string			:group_activity_information
      t.string			:group_description
      t.string			:group_website
      t.string			:group_photo
      t.string			:year_participated
      t.boolean			:approved
    end
  end
end
