class AddImgColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :img_url, :string 
  end
end
