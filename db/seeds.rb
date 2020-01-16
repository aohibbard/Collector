# User.destroy_all
# Artwork.destroy_all 

Artist.create(name: "Kiki Smith", birth_year: "1954")
Artist.create(name: "Felix Gonzalez-Torres", birth_year: "1957")
Artist.create(name: "Jenny Holzer", birth_year: "1950")

Artwork.create(title: "Untitled (Perfect Lovers)", material: "two clocks", year: "1993", dimensions: "13 1/2 × 27 × 2 in")
Artwork.create(title: "Tail", material: "beeswax", year: "1993", dimensions: "60 x 80 x 100 inches")
Artwork.create(title: "Selection from the Survival Series: Use What Is Dominant...", year: "1983-1985", material: "screeprint on brushed aluminum", dimensions: "15 x 18 in")
Artwork.create(title: "Lilith", year: "1994", material: "silicon bronze and glass", dimensions: "33 × 27 1/2 × 19 in")

10.times do 
    User.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: Faker::Internet.password(min_length: 5, max_length: 10, mix_case: true))
end 

#User : Derek McDog, password123, derek@email.com




#Create Artist (assign artworks)
# t.string :name, index: true 
# t.integer :birth_year




# create artworks 
# t.integer :user_id
# t.integer :artist_id 
# t.string :title, index: true 
# t.string :year, index: true 
# t.string :material, index: true 
# t.string :dimensions
# t.boolean :owned