class Artwork < ActiveRecord::Base 
    belongs_to :artist
    belongs_to :user

    def slug
        title.downcase.gsub(" ", "-")
    end 

    def self.find_by_slug(slug)
        Artwork.all.find{|artwork| artwork.slug == slug}
    end 

    def last_name
        self.artist.name.split[-1]
    end 

    # def owned 
        # if self.user_id == nil 
            # self.owned = false 
        # else
            # self.owned = true 
        # end 
    # end 
    #can only have one user_id 
end 