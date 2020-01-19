class AddColumnsToArtists < ActiveRecord::Migration
  def change
    change_table :artists do |t|
      t.remove :birth_year
      t.string :birthday
      t.string :deathday
      t.string :nationality, index: true 
      t.text :biography
    end 
  end
end
