class AddColumnNamesToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :name_sorted, :string
  end
end
