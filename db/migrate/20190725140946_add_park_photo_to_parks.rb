class AddParkPhotoToParks < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :park_photo, :string
  end
end
