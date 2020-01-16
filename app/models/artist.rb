class Artist < ActiveRecord::Base 
    has_many :artworks
    has_many :users, through: :artworks 

    def slug
        name.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Artist.all.find{|artist| artist.slug == slug}
    end 

    # get API response
    # def get_api_response
    #     BASE_URI = "https://api.artsy.net/api"
    #     uri = URI.parse(URI.encode(endpoint))
    #     api_response = Net::HTTP.get(uri)
    #     response = JSON.parse(api_response)
    #     response
    # end 

end 