class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, index: true 
      t.integer :birth_year

      t.timestamp null: false 
    end 
  end
end
