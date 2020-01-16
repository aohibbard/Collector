class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.integer :user_id
      t.integer :artist_id 
      t.string :title, index: true 
      t.string :year, index: true 
      t.string :material, index: true 
      t.string :dimensions
      t.boolean :owned

      t.timestamp null: false 
    end 

  end
end
